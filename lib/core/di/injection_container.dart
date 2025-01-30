import 'package:asroo_store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:asroo_store/core/app/upload_image/data_source/upload_image_data_source.dart';
import 'package:asroo_store/core/app/upload_image/repo/upload_image_repo.dart';
import 'package:flutter/material.dart';

import '../app/app_cubit/app_cubit.dart';
import '../../features/auth/data/data_source/auth_data_source.dart';
import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../service/graphql/api_service.dart';
import '../service/graphql/dio_factory.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
//  sl.registerLazySingleton(() => ConnectivityController.instance);
  //sl.registerLazySingleton(() => SharedPref());
  await _initCore();
  // sl.registerLazySingleton(() => AppBlocObserver());
  // sl.registerLazySingleton(() => EnvVariable());
  // sl.registerLazySingleton(() => Firebase.initializeApp());

  await _initAuth();
}

Future<void> _initCore() async {
  final dio = DioFactory.getDio();
  final navigatorKey = GlobalKey<NavigatorState>();
  sl..registerLazySingleton(AppCubit.new)
  ..registerLazySingleton<ApiService>(() => ApiService(dio))
  ..registerSingleton<GlobalKey<NavigatorState>>(navigatorKey)
  .. registerFactory(()=> UploadImageCubit(sl()) )
  .. registerLazySingleton(() => UploadImageRepo(sl()))
  ..registerLazySingleton(() => UploadImageDataSource(sl()))
  
  ;
}

Future<void> _initAuth() async {
  sl
    ..registerFactory(() => AuthBloc(sl()))
    ..registerLazySingleton(() => AuthRepos(sl()))
    ..registerLazySingleton(() => AuthDataSource(sl()))
    ;
}
