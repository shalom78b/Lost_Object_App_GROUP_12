import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;
import 'package:lost_and_found/features/authentication/data/models/session_model.dart';
import 'package:lost_and_found/utils/constants.dart';
import '../secure_storage/secure_storage.dart';

class HttpInterceptor extends Interceptor {
  final FlutterSecureStorage _storage;

  HttpInterceptor(this._storage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll({'Content-Type': 'application/json'});

    final noTokenURLs = <String>[
      '/register',
      '/login',
    ];

    if (noTokenURLs.contains(options.path)) {
      final language = await _storage.read(key: LOCALE);
      options.headers.addAll({'Accept-Language': language ?? "en"});
      return handler.next(options);
    }

    if (await _storage.containsKey(key: TOKEN)) {
      final token = await _storage.read(key: TOKEN);
      final expire = await _storage.read(key: EXPIRE);
      final language = await _storage.read(key: LOCALE);
      final expireDate = DateTime.fromMillisecondsSinceEpoch(int.parse(expire!) * 1000, isUtc: true);
      final now = DateTime.now().toUtc();

      if (now.isBefore(expireDate)) {
        options.headers.addAll({'Authorization': 'Bearer $token', 'Accept-Language': language ?? "en"});
      } else {
        final user = await _storage.read(key: USER);
        final psw = await _storage.read(key: PASSWORD);

        if (user != null && psw != null) {
          final response = await http.post(Uri.parse("$baseUrl/auth/login"),
              body: jsonEncode(
                {
                  "user": user,
                  "password": psw,
                },
              ));

          if (response.statusCode == 200) {
            final session = SessionModel.fromJson(jsonDecode(response.body));
            await _storage.write(key: ID, value: session.user.toString());
            await _storage.write(key: EXPIRE, value: session.expire.toString());
            await _storage.write(key: TOKEN, value: session.token);

            options.headers.addAll({'Authorization': 'Bearer $token'});
          }
        }
      }
    }

    return handler.next(options);
  }
}
