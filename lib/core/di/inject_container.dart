import 'package:asroo_store/core/app/app_cubit/app_cubit.dart';
import 'package:asroo_store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:asroo_store/core/app/upload_image/data_source/upload_image_data_source.dart';
import 'package:asroo_store/core/app/upload_image/repo/upload_image_repo.dart';
import 'package:asroo_store/core/services/graphql/api_service.dart';
import 'package:asroo_store/core/services/graphql/dio_factory.dart';
import 'package:asroo_store/features/auth/data/data_source/auth_data_source.dart';
import 'package:asroo_store/features/auth/data/repos/auth_repo.dart';
import 'package:asroo_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> setupInject() async {
  
  await _initCore();
    await _initAuth();
}

Future<void> _initCore() async {
  final dio=DioFactory.getDio();
  final navigatorKey = GlobalKey<NavigatorState>();
  //to call more than one time
   sl..registerFactory(AppCubit.new)
   ..registerFactory<ApiService>(()=>ApiService(dio))
  ..registerSingleton<GlobalKey<NavigatorState>>(navigatorKey)
     ..registerFactory(() => UploadImageCubit(sl()))
     ..registerFactory(() => UploadImageRepo(sl()))
     ..registerFactory(() => UploadImageDataSource(sl()));
}
Future<void> _initAuth() async {
  sl
    ..registerFactory(() => AuthBloc(sl()))
    ..registerLazySingleton(() => AuthRepos(sl()))
    ..registerLazySingleton(() => AuthDataSource(sl()));
}
