import 'package:fluxstore/bloc/theme/theme_bloc.dart';
import 'package:fluxstore/injection/injection.dart';

class BlocModule {
  BlocModule._();
  static void init() {
    final injection = Injection.instance;
    injection.registerLazySingleton<ThemeBloc>(() => ThemeBloc());
  }
}
