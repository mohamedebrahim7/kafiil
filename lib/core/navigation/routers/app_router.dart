import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../features/auth/forget_password/presentation/cubit/forget_password_cubit.dart';
import '../../../features/auth/forget_password/presentation/views/forget_password_screen.dart';
import '../../../features/auth/login/presentation/cubit/log_in_cubit.dart';
import '../../../features/auth/login/presentation/views/login_screen.dart';
import '../../../features/auth/register/presentation/cubit/register_cubit.dart';
import '../../../features/auth/register/presentation/views/register_screen.dart';
import '../../../features/home/main_router_screen.dart';
import '../cubits/app_settings_manager_state.dart';
import 'constants.dart';

class AppRouter {
  final AppSettingsManagerState appSettingsManagerState;

  AppRouter({required this.appSettingsManagerState});

  String? initialLocation() {
    switch (appSettingsManagerState.navigationState) {
      case NavigationState.onLogin:
        return loginRoutePath;
      case NavigationState.onHome:
        return mainTabRouterRoutePath;
    }
  }

  late final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: initialLocation(),
    routes: [
      // splash screen

      // login screen and children
      GoRoute(
          path: loginRoutePath,
          name: loginRoutePath,
          builder: (context, state) => BlocProvider(
                create: (context) => LogInCubit(),
                child: const LoginScreen(),
              ),
          routes: [
            GoRoute(
              name: registerRoutePath,
              path: registerRoutePath,
              builder: (context, state) => BlocProvider(
                create: (context) => RegisterCubit(),
                child: const RegisterScreen(),
              ),
            ),
            GoRoute(
              name: forgetRoutePath,
              path: forgetRoutePath,
              builder: (context, state) => BlocProvider(
                create: (context) => ForgetPasswordCubit(),
                child: const ForgetPasswordScreen(),
              ),
            ),
          ]),
      // home screen and children
      GoRoute(
        name: mainTabRouterRoutePath,
        path: mainTabRouterRoutePath,
        builder: (context, state) {
          LoginResponse? loginResponse =
              state.extra as LoginResponse?; // -> casting is important
          return MainRouterScreen(
            loginResponse: loginResponse,
          );
        },
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Text(
              state.error.toString(),
            ),
          ),
        ),
      );
    },
  );
}
