import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_and_found/features/authentication/presentation/widgets/login/login_button.dart';
import 'package:lost_and_found/features/authentication/presentation/widgets/login/password_input.dart';
import 'package:lost_and_found/features/authentication/presentation/widgets/login/sign_up.dart';
import 'package:lost_and_found/features/authentication/presentation/widgets/login/user_input.dart';
import 'package:lost_and_found/features/badges/presentation/bloc/badge_bloc.dart';
import 'package:lost_and_found/features/item/presentation/bloc/home/home_bloc.dart';
import 'package:lost_and_found/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:lost_and_found/utils/utility.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/presentation/home_controller/bloc/home_controller_bloc.dart';
import '../../../../../core/presentation/widgets/title_logo.dart';
import '../../bloc/login/login_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              final authFailureOrSuccess = state.authFailureOrSuccess;

              if (authFailureOrSuccess != null) {
                authFailureOrSuccess.fold(
                    (failure) => showBasicErrorSnackbar(context, failure),
                    (_) => {
                          Navigator.popUntil(context, (route) => route.isFirst),
                          Navigator.of(context).pushReplacementNamed('/'),

                          // Update home/user content
                          context.read<HomeControllerBloc>().add(const HomeControllerEvent.tabChanged(0)),
                          context.read<HomeBloc>().add(const HomeEvent.homeCreated()),
                          context.read<UserBloc>().add(const UserEvent.contentCreated()),
                          context.read<BadgeBloc>().add(const BadgeEvent.badgeCreated()),
                        });
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                titleLogoVertical(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const UserInput(),
                    const SizedBox(height: 12),
                    const PasswordInput(),
                    SizedBox(height: 4.h),
                    const LoginButton(),
                  ],
                ),
                const SizedBox(height: 15),
                const SignUpText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
