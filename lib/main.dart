import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluxstore/app_config/app_config.dart';
import 'package:fluxstore/injection/injection.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.isFirstLogin = await checkFirstLogin();
  Injection.init();
  await Injection.instance.allReady();
  runApp(const MyApp());
}

Future<bool> checkFirstLogin() async {
  const storage = FlutterSecureStorage();
  var value = await storage.read(key: 'firstLogin');
  if (value != null) {
    return false;
  } else {
    await storage.write(key: 'firstLogin', value: 'true');
    return true;
  }
}
