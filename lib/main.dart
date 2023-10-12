import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluxstore/app_config/app_config.dart';
import 'package:fluxstore/injection/injection.dart';

import 'app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  AppConfig.isFirstLogin = await checkFirstLogin();
  Injection.init();
  await Injection.instance.allReady();
  SystemChannels.textInput.invokeMethod('TextInput.hide');
  AppConfig.cameras = await availableCameras();
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
