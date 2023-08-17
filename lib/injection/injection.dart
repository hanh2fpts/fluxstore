import 'package:get_it/get_it.dart';

import 'modules/bloc_module.dart';

class Injection {
  Injection._();
  static GetIt instance = GetIt.instance;
  static void init() {
    BlocModule.init();
  }
}
