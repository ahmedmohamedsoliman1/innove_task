import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:innova_interview/config/dependency_injection/DP.dart';
import 'package:innova_interview/config/network/api_client.dart';
import 'package:innova_interview/features/series_feature/data/models/classes_data_model.dart';
import 'package:innova_interview/features/series_feature/data/models/community_data_model.dart';
import 'package:innova_interview/features/series_feature/data/models/series_model.dart';
import 'package:innova_interview/features/series_feature/domain/repository/series_repo_impl.dart';

void main () {

  /// arrange
  late SeriesRepoImpl seriesRepoImpl ;

  setUpAll(() {
    seriesRepoImpl = SeriesRepoImpl(apiClient: Dp.getIt());
  });
  group("Test All Series Functions", () {
    test("Test Series Data", () async{

      /// act
      var response = await seriesRepoImpl.getSeriesData();
      var model = SeriesDataModel.fromJson({

          "id": "1",
          "title": "THE CHANNALGE",
          "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAuY_EOMDfMYa6t0Hp_Zf90xmRXgKe6eBV8w&s",
          "name": "jack kerman",
          "description": "Experts define physical fitness as “one's ability to execute daily activities with optimal performance, endurance, and strength with the management of disease, fatigue, and stress and reduced sedentary behavior.” This description goes beyond being able to run quickly or lift heavy weights",
          "video": "https://www.google.com/search?sca_esv=24cfdd5209cb3bf0&sca_upv=1&sxsrf=ADLYWIIet9DP85mw8N9efjJJ7c1kf9xaag:1722078078809&q=fitness+train+short+video&tbm=vid&source=lnms&fbs=AEQNm0BuRU-369efTOPqam2nS0P3Z2xgYjdwIs7iOMYRQsGwadpMveDWcQ5rQfQjz-qretQCHYnjQoEyZTAh1ys11ZbmbuaStbew0NwItnMKmY7F0A-etsxgGcMA4iVSSORy_CbQJUr2Y1yCj-LICW4jbTsTwn_Sp2vFBjcSHNpIZeCemILqaF4qqCKalwxEmYx9xuHzBhJtMcra7C9Q000h8D0i-6PmFYABSCVCg5IhNDlNcVXyFbhMVAqpqcRcG5-MGGvuDCXW&sa=X&ved=2ahUKEwiwu6bhiMeHAxWl_rsIHVtnBcEQ0pQJegQIERAB&biw=1318&bih=612&dpr=1#",
          "work": "INSTRUCTOR",
          "work_desc": "Jack is international yogo teacher , who grow up in miami ,he spent his younth in new zeahand ..."

      });
      /// assert
      expect(response, model);
    });

    test("Test Classes Data", () async{

      /// act
      var response = await seriesRepoImpl.getClassesData();
      var model = ClassesDataModel.fromJson({
        "data": [
          {
            "video": "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
            "time": "(30:21)",
            "title": "DAYS 2 : TRAIN SHOULDER AND LET YOUR POWER RISE",
            "description": "test your strength , this upper body will condition your arm"
          },
          {
            "video": "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
            "time": "8",
            "title": "DAYS 5 : TRAIN SHOULDER AND LET YOUR POWER RISE",
            "description": "test your strength , this upper body will condition your arm"
          },
          {
            "video": "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
            "time": "8",
            "title": "DAYS 7 : TRAIN SHOULDER AND LET YOUR POWER RISE",
            "description": "test your strength , this upper body will condition your arm"
          }
        ]
      });
      /// assert
      expect(response, model);
    });


    test("Test Community Data", () async{

      /// act
      var response = await seriesRepoImpl.getCommunityData();
      var model = CommunityDataModel.fromJson({
        "data": [
          {
            "name": "David marcos",
            "date": "DAY 7",
            "time": "8",
            "title": "LOWER BODY STRENGHT",
            "image": "https://starresults.com/wp-content/uploads/2019/06/Coaching-the-coaches.png"
          },
          {
            "name": "Tom rydel",
            "date": "DAY 3",
            "time": "4",
            "title": "CORE ISOLATION",
            "image": "https://olasjobs.org/resources/wp-content/uploads/2023/03/How-to-Become-a-Professional-High-School-Coach-1024x683.webp"
          },
          {
            "name": "Jon salmok",
            "date": "DAY 8",
            "time": "2",
            "title": "LOWER BODY STRENGHT",
            "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGhr70oL0rKf_SfQGo77DIgl_LPPHfuuyMpw&s"
          }
        ]
      });
      /// assert
      expect(response, model);
    });

  });
}