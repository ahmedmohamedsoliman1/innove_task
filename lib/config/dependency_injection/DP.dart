import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:innova_interview/config/network/api_client.dart';
import 'package:innova_interview/features/series_feature/domain/repository/series_repo_impl.dart';
import 'package:innova_interview/features/series_feature/presentation/home_sereen_view_model.dart';

import '../../features/series_feature/domain/use_cases/get_series_use_case.dart';

class Dp {
  static GetIt getIt = GetIt.instance ;
  static void setUp () {
    getIt.registerLazySingleton<Dio>(() => Dio());
    getIt.registerLazySingleton<ApiClient>(() => ApiClient(dio: getIt()));
    getIt.registerLazySingleton<SeriesRepoImpl>(() => SeriesRepoImpl(apiClient: getIt()));
    getIt.registerLazySingleton<GetSeriesUseCase>(() => GetSeriesUseCase(seriesRepoImpl: getIt()));
    getIt.registerLazySingleton<HomeScreenViewModel>(() => HomeScreenViewModel(getSeriesUseCase: getIt()));
  }

}