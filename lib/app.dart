import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxstore/app_config/app_config.dart';
import 'package:fluxstore/bloc/theme/theme_bloc.dart';
import 'package:fluxstore/injection/injection.dart';
import 'package:fluxstore/presentation/home/home_page.dart';
import 'package:fluxstore/presentation/intro/welcome_page.dart';
import 'package:fluxstore/app_config/route_config.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Injection.instance<ThemeBloc>()..add(InitThemeEvent()),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Color(state.mainColor),
                brightness: state.isDarkTheme ? Brightness.dark : Brightness.light,
              ),
              fontFamily: 'ProductSans',
              useMaterial3: true,
            ),
            initialRoute: '/',
            onGenerateRoute: (settings) => generateRoutes(settings),
            home: AppConfig.isFirstLogin ? const WelcomePage() : const HomePage(),
          );
        },
      ),
    );
  }
}
