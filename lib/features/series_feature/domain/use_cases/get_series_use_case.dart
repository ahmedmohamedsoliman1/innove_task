import 'package:either_dart/either.dart';
import 'package:innova_interview/features/series_feature/data/models/classes_data_model.dart';
import 'package:innova_interview/features/series_feature/data/models/community_data_model.dart';
import 'package:innova_interview/features/series_feature/data/models/error_data_model.dart';
import 'package:innova_interview/features/series_feature/domain/repository/series_repo_impl.dart';

import '../../data/models/series_model.dart';

class GetSeriesUseCase {
  SeriesRepoImpl seriesRepoImpl ;

  GetSeriesUseCase ({required this.seriesRepoImpl});

  Future <Either <ErrorDataModel , SeriesDataModel>> getSeriesData ()async {
    return await seriesRepoImpl.getSeriesData();
  }

  Future <Either <ErrorDataModel , CommunityDataModel>> getCommunityData ()async {
    return await seriesRepoImpl.getCommunityData();
  }

  Future <Either <ErrorDataModel , ClassesDataModel>> getClassesData ()async {
    return await seriesRepoImpl.getClassesData();
  }
}