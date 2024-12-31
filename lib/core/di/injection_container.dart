import 'package:asroo_store/core/app/app_cubit/app_cubit.dart';
import 'package:asroo_store/core/service/graphql/api_service.dart';
import 'package:asroo_store/core/service/graphql/dio_factory.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
//  sl.registerLazySingleton(() => ConnectivityController.instance);
  //sl.registerLazySingleton(() => SharedPref());
  await _initCore();
  // sl.registerLazySingleton(() => AppBlocObserver());
  // sl.registerLazySingleton(() => EnvVariable());
  // sl.registerLazySingleton(() => Firebase.initializeApp());
}

Future<void> _initCore() async {
  final dio = DioFactory.getDio();
  sl.registerLazySingleton(AppCubit.new);
  sl.registerLazySingleton<ApiService>(() => ApiService(dio));
}
