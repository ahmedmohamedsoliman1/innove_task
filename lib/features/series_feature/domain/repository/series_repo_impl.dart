import 'package:either_dart/either.dart';
import 'package:innova_interview/config/check_connection/check_internet_connection.dart';
import 'package:innova_interview/config/network/api_client.dart';
import 'package:innova_interview/config/network/api_constants.dart';
import 'package:innova_interview/features/series_feature/data/models/classes_data_model.dart';
import 'package:innova_interview/features/series_feature/data/models/community_data_model.dart';
import 'package:innova_interview/features/series_feature/data/models/error_data_model.dart';
import 'package:innova_interview/features/series_feature/data/repository/series_repo.dart';

import '../../data/models/series_model.dart';

class SeriesRepoImpl implements SeriesRepo {
  ApiClient apiClient;

  SeriesRepoImpl({required this.apiClient});

  @override
  Future<Either<ErrorDataModel, SeriesDataModel>> getSeriesData() async {
    if (await checkConnection()) {
      var url = ApiConstants.getSeriesData;
      try {
        var response = await apiClient.get(url: url);
        if (response.statusCode == 200) {
          return Right(SeriesDataModel.fromJson(response.data));
        } else {
          return Left(ErrorDataModel.fromJson(response.data));
        }
      } catch (e) {
        rethrow;
      }
    } else {
      return Left(
          ErrorDataModel(success: false, message: "Check internet connection"));
    }
  }

  @override
  Future<Either<ErrorDataModel, CommunityDataModel>> getCommunityData() async {
    if (await checkConnection()) {
      var url = ApiConstants.getCommunityData;
      try {
        var response = await apiClient.get(url: url);
        if (response.statusCode == 200) {
          return Right(CommunityDataModel.fromJson(response.data));
        } else {
          return Left(ErrorDataModel.fromJson(response.data));
        }
      } catch (e) {
        rethrow;
      }
    } else {
      return Left(
          ErrorDataModel(success: false, message: "Check internet connection"));
    }
  }

  @override
  Future<Either<ErrorDataModel, ClassesDataModel>> getClassesData() async {
    if (await checkConnection()) {
      var url = ApiConstants.getClassesData;
      try {
        var response = await apiClient.get(url: url);
        if (response.statusCode == 200) {
          return Right(ClassesDataModel.fromJson(response.data));
        } else {
          return Left(ErrorDataModel.fromJson(response.data));
        }
      } catch (e) {
        rethrow;
      }
    } else {
      return Left(
          ErrorDataModel(success: false, message: "Check internet connection"));
    }
  }
}
