import 'package:asroo_store/asroo_store_app.dart';
import 'package:asroo_store/core/app/env.variables.dart';
import 'package:asroo_store/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EnvVariables.instance.init(envType: EnvTypeEnum.dev);

  //to prevent user from trying to oriented the device
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
      ).then((_) {
       runApp(const AsrooStoreApp());
      });
  
}
