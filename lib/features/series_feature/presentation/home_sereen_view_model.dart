import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:innova_interview/features/series_feature/domain/use_cases/get_series_use_case.dart';
import 'package:video_player/video_player.dart';

import '../data/models/classes_data_model.dart';
import '../data/models/community_data_model.dart';
import 'home_navigator.dart';

class HomeScreenViewModel extends ChangeNotifier {
  late HomeScreenNavigator navigator ;

  GetSeriesUseCase getSeriesUseCase ;

  bool isGetDataLoading = false ;
  bool isCommunityDataLoading = false ;
  bool isClassesDataLoading = false ;
  List<CommunityData>? communityList = [] ;
  List<ClassesData>? classesList = [] ;

  TextEditingController controller = TextEditingController();


  String seriesId = "" ;
  String seriesImage = "" ;
  String seriesTitle = "" ;
  String seriesName = "" ;
  String seriesDescription = "" ;
  String seriesVideo = "" ;
  String errorText = "" ;
  String seriesWork = "" ;
  String seriesWorkDesc = "" ;
  late VideoPlayerController videoPlayerController ;
  
  bool btPressed = false ;

  HomeScreenViewModel ({required this.getSeriesUseCase});

  void getSeriesData () async {
    isGetDataLoading = true ;
    notifyListeners();
    var response = await getSeriesUseCase.getSeriesData();
    if (response.isRight){
      isGetDataLoading = false ;
      notifyListeners();
      seriesId = response.right.id! ;
      seriesImage = response.right.image! ;
      seriesName = response.right.name! ;
      seriesTitle = response.right.title! ;
      seriesDescription = response.right.description! ;
      seriesVideo = response.right.video! ;
      seriesWork = response.right.work!;
      seriesWorkDesc = response.right.workDesc! ;
      initVideoPlayerController("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4");
    }else {
      isGetDataLoading = false ;
      notifyListeners();
     errorText = response.left.message!;

      videoPlayerController = VideoPlayerController.networkUrl(Uri.parse("https://www.google.com/search?sca_esv=24cfdd5209cb3bf0&sca_upv=1&sxsrf=ADLYWIIet9DP85mw8N9efjJJ7c1kf9xaag:1722078078809&q=fitness+train+short+video&tbm=vid&source=lnms&fbs=AEQNm0BuRU-369efTOPqam2nS0P3Z2xgYjdwIs7iOMYRQsGwadpMveDWcQ5rQfQjz-qretQCHYnjQoEyZTAh1ys11ZbmbuaStbew0NwItnMKmY7F0A-etsxgGcMA4iVSSORy_CbQJUr2Y1yCj-LICW4jbTsTwn_Sp2vFBjcSHNpIZeCemILqaF4qqCKalwxEmYx9xuHzBhJtMcra7C9Q000h8D0i-6PmFYABSCVCg5IhNDlNcVXyFbhMVAqpqcRcG5-MGGvuDCXW&sa=X&ved=2ahUKEwiwu6bhiMeHAxWl_rsIHVtnBcEQ0pQJegQIERAB&biw=1318&bih=612&dpr=1#"))..initialize().then((_){
        if (btPressed){
          videoPlayerController.play();
        }else {
          videoPlayerController.pause();
        }
      });
    }
  }
  
  initVideoPlayerController (String url) {
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url))..initialize().then((_){
      if (btPressed){
        videoPlayerController.play();
      }else {
        videoPlayerController.pause();
      }
      notifyListeners();
    });
  }

  void equalPressedBt () {
    btPressed = !btPressed ;
    notifyListeners();
  }


  void getCommunityData () async {
    isCommunityDataLoading = true ;
    notifyListeners();
    var response = await getSeriesUseCase.getCommunityData();
    if (response.isRight){
      isCommunityDataLoading = false ;
      notifyListeners();
     communityList = response.right.data ;
    }else {
      isCommunityDataLoading = false ;
      notifyListeners();
      errorText = response.left.message!;
      communityList = [] ;
    }
  }

  void getClassesData () async {
    isClassesDataLoading = true ;
    notifyListeners();
    var response = await getSeriesUseCase.getClassesData();
    if (response.isRight){
      isClassesDataLoading = false ;
      notifyListeners();
      classesList = response.right.data ;
      initVideoPlayerController("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4");
    }else {
      isClassesDataLoading = false ;
      notifyListeners();
      errorText = response.left.message!;
      classesList = [] ;
    }
  }

}