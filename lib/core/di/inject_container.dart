import 'package:asroo_store/core/app/app_cubit/app_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> setupInject() async {
  
  await _initCore();
}

Future<void> _initCore() async {
  //to call more than one time
   sl.registerFactory(AppCubit.new);
}
