import 'package:either_dart/either.dart';
import '../models/classes_data_model.dart';
import '../models/community_data_model.dart';
import '../models/error_data_model.dart';
import '../models/series_model.dart';

abstract class SeriesRepo {

  Future <Either <ErrorDataModel , SeriesDataModel>> getSeriesData ();
  Future <Either <ErrorDataModel , CommunityDataModel>> getCommunityData ();
  Future <Either <ErrorDataModel , ClassesDataModel>> getClassesData () ;

}