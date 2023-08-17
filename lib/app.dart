import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxstore/app_config/app_config.dart';
import 'package:fluxstore/cubit/home_cubit.dart';
import 'package:fluxstore/injection/injection.dart';
import 'package:fluxstore/presentation/home_page.dart';
import 'package:fluxstore/presentation/welcome_page.dart';
import 'package:fluxstore/route_config.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        fontFamily: 'ProductSans',
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) => generateRoutes(settings),
      home: AppConfig.isFirstLogin
          ? const WelcomePage()
          : BlocProvider(
              create: (context) => Injection.instance<HomeCubit>(),
              child: const HomePage(),
            ),
    );
  }
}
