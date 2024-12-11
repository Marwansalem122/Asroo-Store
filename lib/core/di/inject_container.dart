import 'package:asroo_store/core/app/app_cubit/app_cubit.dart';
import 'package:asroo_store/core/services/graphql/api_service.dart';
import 'package:asroo_store/core/services/graphql/dio_factory.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> setupInject() async {
  
  await _initCore();
}

Future<void> _initCore() async {
  final dio=DioFactory.getDio();
  //to call more than one time
   sl..registerFactory(AppCubit.new)

   ..registerFactory<ApiService>(()=>ApiService(dio));
   
}
