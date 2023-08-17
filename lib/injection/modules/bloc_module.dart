import 'package:fluxstore/cubit/home_cubit.dart';
import 'package:fluxstore/injection/injection.dart';

class BlocModule {
  BlocModule._();
  static void init() {
    final injection = Injection.instance;
    injection.registerLazySingleton<HomeCubit>(() => HomeCubit());
  }
}
