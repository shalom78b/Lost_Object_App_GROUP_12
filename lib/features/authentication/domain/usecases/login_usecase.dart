import 'package:dartz/dartz.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lost_and_found/core/status/success.dart';

import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/status/failures.dart';
import '../../../../core/domain/repositories/authentication_repository.dart';

part 'login_usecase.g.dart';

class LoginUseCase implements UseCase<Success, LoginParams> {
  final AuthenticationRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Success>> call(LoginParams? params) async {
    return await _repository.login(params);
  }
}

@JsonSerializable()
class LoginParams {
  final String user;
  final String password;
  final String? token;

  LoginParams({
    required this.user,
    required this.password,
    required this.token,
  });

  Map<String, dynamic> toJson() => _$LoginParamsToJson(this);
}
