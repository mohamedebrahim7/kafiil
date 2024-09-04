import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/navigation/cubits/app_settings_manager_cubit.dart';
import 'core/navigation/cubits/app_settings_manager_state.dart';
import 'core/navigation/routers/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppSettingsManagerCubit>(
          create: (BuildContext context) => AppSettingsManagerCubit(),
        ),
      ],
      child: BlocBuilder<AppSettingsManagerCubit, AppSettingsManagerState>(
        // buildWhen: (previous, current) => previous.userData != current.userData,
        builder: (context, state) {
          late final appRouter = AppRouter(appSettingsManagerState: state);
          final router = appRouter.router;

          return MaterialApp.router(
            supportedLocales: const [
              Locale('en', ''),
              Locale('ar', ''),
            ],
            locale: const Locale("en"),
            localizationsDelegates: const [
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            // theme: state.isDarkModeEnabled ? ThemeData.dark() : ThemeData.light() ,
            theme: AppTheme.lightTheme(MediaQuery.sizeOf(context).height),
            title: 'kafiil',
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
          );
        },
      ),
    );
  }
}
