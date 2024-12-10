import 'package:asroo_store/asroo_store_app.dart';
import 'package:asroo_store/core/app/bloc_observer.dart';
import 'package:asroo_store/core/app/env.variables.dart';
import 'package:asroo_store/core/di/inject_container.dart';
import 'package:asroo_store/core/routes/app_router.dart';
import'package:asroo_store/core/services/shared_pref/shared_pref.dart';
import 'package:asroo_store/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EnvVariables.instance.init(envType: EnvTypeEnum.dev);
  await SharedPref().instantiatePreferences();
await setupInject();
  Bloc.observer = AppBlocObserver();
  //to prevent user from trying to oriented the device
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  ).then((_) {
    runApp(
      AsrooStoreApp(
        appRouter: AppRouter(),
      ),
    );
  });
}
