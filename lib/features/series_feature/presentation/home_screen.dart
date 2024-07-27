import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innova_interview/config/dependency_injection/DP.dart';
import 'package:innova_interview/core/app_colors.dart';
import 'package:innova_interview/core/app_strings.dart';
import 'package:innova_interview/features/series_feature/presentation/home_navigator.dart';
import 'package:innova_interview/features/series_feature/presentation/home_sereen_view_model.dart';
import 'package:innova_interview/widgets/app_button.dart';
import 'package:innova_interview/widgets/app_empty_state.dart';
import 'package:innova_interview/widgets/app_shimmer.dart';
import 'package:innova_interview/widgets/app_text.dart';
import 'package:innova_interview/widgets/app_textFormField.dart';
import 'package:provider/provider.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements HomeScreenNavigator{

  HomeScreenViewModel viewModel = HomeScreenViewModel(getSeriesUseCase: Dp.getIt()) ;

  @override
  void initState() {
    viewModel.navigator = this ;
    viewModel.getSeriesData();
    viewModel.getCommunityData();
    viewModel.getClassesData() ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Consumer<HomeScreenViewModel>(
                      builder: (context , provider , _) {
                        if (provider.isGetDataLoading){
                          return AppShimmer(
                              shimmerWidget: Column(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height*0.5,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10) ,
                                        bottomLeft: Radius.circular(10)
                                      ),
                                      color: AppColors.primaryColor,
                                    ),
                                  ) ,
                                  SizedBox(height: 15.h,),
                                  Container(
                                    height: MediaQuery.of(context).size.height*0.05,
                                    width: MediaQuery.of(context).size.width*0.6,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.primaryColor,
                                    ),
                                  ) ,
                                  SizedBox(height: 15.h,),
                                  Container(
                                    height: MediaQuery.of(context).size.height*0.05,
                                    width: MediaQuery.of(context).size.width*0.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.primaryColor,
                                    ),
                                  ) ,
                                  SizedBox(height: 15.h,),
                                  Container(
                                    height: MediaQuery.of(context).size.height*0.5,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10) ,
                                          bottomLeft: Radius.circular(10)
                                      ),
                                      color: AppColors.primaryColor,
                                    ),
                                  ) ,
                                ],
                              ));
                        }else if (provider.seriesImage.isNotEmpty){
                          return Column(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height*0.5,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10) ,
                                      bottomLeft: Radius.circular(10)
                                  ),
                                ),
                                child: Image(image: NetworkImage(provider.seriesImage),
                                fit: BoxFit.fill,),
                              ) ,
                              SizedBox(height: 10.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  appText(
                                      text: provider.seriesTitle,
                                      color: AppColors.primaryColor,
                                      fontSize: 22 ,
                                      fontWeight: FontWeight.w700),
                                ],
                              ) ,
                              SizedBox(height: 10.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  appText(
                                      text: provider.seriesName,
                                      color: AppColors.greyColor,
                                      fontSize: 18 ,
                                      fontWeight: FontWeight.w500),
                                ],
                              ),
                              SizedBox(height: 10.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  customButton(() {
                                    
                                  }, context, 
                                      appText(
                                          text: AppStrings.startPracting,
                                          color: AppColors.whiteColor,
                                          fontSize: 18),
                                      AppColors.primaryColor)
                                ],
                              ),
                              SizedBox(height: 20.h,),
                              DefaultTabController(
                                length: 3 ,
                                child: Column(
                                  children: <Widget>[
                                      ButtonsTabBar(
                                        backgroundColor: Colors.blue,
                                        unselectedBackgroundColor: Colors.grey[300],
                                        unselectedLabelStyle: const TextStyle(color: Colors.black),
                                        labelStyle:
                                        const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                        tabs: const [
                                          Tab(
                                            icon: Icon(Icons.all_out),
                                            text: AppStrings.overview,
                                          ),
                                          Tab(
                                            icon: Icon(Icons.sports),
                                            text: AppStrings.classes,
                                          ),
                                          Tab(icon: Icon(Icons.home_filled) ,
                                            text: AppStrings.community,),
                                        ],
                                      ),
                                 SizedBox(
                                  width: 400,
                                  height: MediaQuery.of(context).size.height,
                                  child: TabBarView(
                                    children: <Widget>[
                                     Padding(
                                       padding: const EdgeInsets.all(15),
                                       child: Column(
                                         children: [
                                           appText(
                                               text: provider.seriesDescription,
                                               color: AppColors.greyColor,
                                               fontSize: 18 ,
                                           fontWeight: FontWeight.w600),
                                           SizedBox(height: 10.h,),
                                           Row(
                                             children: [
                                               appText(
                                                   text: AppStrings.readMore,
                                                   color: AppColors.primaryColor,
                                                   fontSize: 18 ,
                                                   fontWeight: FontWeight.bold),
                                             ],
                                           ),
                                           SizedBox(height: 10.h,),
                                           SizedBox(
                                             width : MediaQuery.of(context).size.width*0.8,
                                               height : MediaQuery.of(context).size.height*0.2,
                                               child: Stack(
                                                 alignment: Alignment.center,
                                                 children: [
                                                   VideoPlayer(provider.videoPlayerController),
                                                   InkWell(
                                                     onTap: (){
                                                       provider.equalPressedBt();
                                                     },
                                                     child: provider.btPressed ?
                                                     const Icon(Icons.pause ,
                                                       color: Colors.white,
                                                       size: 35,) :
                                                     const Icon(Icons.play_arrow ,
                                                       color: Colors.white,
                                                       size: 35,),
                                                   )
                                                 ],
                                               )) ,
                                           SizedBox(height: 15.h,),
                                           Row(
                                             children: [
                                               const CircleAvatar(
                                                 radius: 50,
                                                 backgroundImage: NetworkImage("https://i0.wp.com/fightforchildren.org/wp-content/uploads/2021/09/Coach-1.jpg?fit=2508%2C1672&ssl=1"),
                                               ),
                                               SizedBox(width: 10.w,),
                                               Column(
                                                 children: [
                                                   appText(
                                                       text: provider.seriesWork,
                                                       color: AppColors.primaryColor,
                                                       fontSize: 20),
                                                   SizedBox(height: 5.h,),
                                                   appText(
                                                       text: provider.seriesName,
                                                       color: AppColors.greyColor,
                                                       fontSize: 18)
                                                 ],
                                               )
                                             ],
                                           ),
                                           SizedBox(height: 15.h,),
                                           appText(
                                               text: provider.seriesWorkDesc,
                                               color: AppColors.greyColor,
                                               fontSize: 18 ,
                                           fontWeight: FontWeight.w600) ,
                                           SizedBox(height: 10.h,),
                                           Row(
                                             children: [
                                               appText(
                                                   text: AppStrings.readMore,
                                                   color: AppColors.primaryColor,
                                                   fontSize: 18 ,
                                                   fontWeight: FontWeight.bold),
                                             ],
                                           ),
                                           SizedBox(height: 20.h,),
                                           Column(
                                             children: [
                                               appText(
                                                   text: AppStrings.totalRunTime,
                                                   color: AppColors.greyColor,
                                                   fontSize: 18 ,
                                               fontWeight: FontWeight.w400) ,
                                               SizedBox(height: 5.h,),
                                               Row(
                                                 mainAxisAlignment: MainAxisAlignment.center,
                                                 children: [
                                                  const Icon(Icons.timelapse_outlined ),
                                                   appText(
                                                       text: "03 hrs 08 min (7 Videos)",
                                                       color: AppColors.primaryColor,
                                                       fontSize: 18 ,
                                                       fontWeight: FontWeight.w400),
                                                 ],
                                               ) ,
                                             ],
                                           )
                                         ],
                                       ),
                                     ),
                                      Consumer<HomeScreenViewModel>(builder: (context , provider , _) {
                                        if (provider.isClassesDataLoading){
                                          return AppShimmer(
                                            shimmerWidget: Column(
                                              children: [
                                                Container(
                                                  height: MediaQuery.of(context).size.height*0.1,
                                                  width: MediaQuery.of(context).size.width*0.8,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: AppColors.primaryColor,
                                                  ),
                                                ),
                                                SizedBox(height: 10.h,),
                                                Container(
                                                  height: MediaQuery.of(context).size.height*0.1,
                                                  width: MediaQuery.of(context).size.width*0.8,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: AppColors.primaryColor,
                                                  ),
                                                )
                                              ],
                                            ),);
                                        }else if (provider.classesList!.isEmpty){
                                          return const Center(child: EmptyState(title: "Empty", subTitle: "There is no classes list yet"));
                                        }else {
                                          return Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: ListView.separated(
                                                physics: const NeverScrollableScrollPhysics(),
                                                separatorBuilder: (context , index) {
                                                  return SizedBox(height: 20.h,);
                                                },
                                                shrinkWrap: true,
                                                itemCount: provider.classesList!.length,
                                                itemBuilder: (context , index) {
                                                  return Column(
                                                    children: [
                                                      SizedBox(
                                                        width: MediaQuery.of(context).size.width*0.7,
                                                        height: MediaQuery.of(context).size.height*0.2,
                                                        child: Stack(
                                                          alignment: Alignment.topLeft,
                                                          children: [
                                                            Stack(
                                                              alignment: Alignment.center,
                                                              children: [
                                                                VideoPlayer(provider.videoPlayerController),
                                                                InkWell(
                                                                  onTap: (){
                                                                    provider.equalPressedBt();
                                                                  },
                                                                  child: provider.btPressed ?
                                                                  const Icon(Icons.pause ,
                                                                    color: Colors.white,
                                                                    size: 35,) :
                                                                  const Icon(Icons.play_arrow ,
                                                                    color: Colors.white,
                                                                    size: 35,),
                                                                )
                                                              ],
                                                            ),
                                                            Container(
                                                              width: 30,
                                                              height: 30,
                                                              color: Colors.white,
                                                              child: Center(
                                                                child: appText(text: "${index+1}",
                                                                    color: AppColors.primaryColor,
                                                                    fontSize: 18),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(height: 10.h,),
                                                      appText(
                                                          text: provider.classesList![index].title!,
                                                          color: AppColors.primaryColor,
                                                          fontSize: 18 ,
                                                        fontWeight: FontWeight.w700 ,
                                                        textAlight: TextAlign.center
                                                      ),
                                                      SizedBox(height: 5.h,),
                                                      appText(
                                                          text: provider.classesList![index].time!,
                                                          color: AppColors.greyColor,
                                                          fontSize: 16 ,
                                                          fontWeight: FontWeight.w400 ,
                                                          textAlight: TextAlign.center
                                                      ),
                                                      SizedBox(height: 5.h,),
                                                      appText(
                                                          text: provider.classesList![index].description!,
                                                          color: AppColors.greyColor,
                                                          fontSize: 16 ,
                                                          fontWeight: FontWeight.w400 ,
                                                          textAlight: TextAlign.center
                                                      )
                                                    ],
                                                  );
                                                }),
                                          );
                                        }
                                      }),
                                      Consumer<HomeScreenViewModel>(builder: (context , provider , _) {
                                        if (provider.isCommunityDataLoading){
                                          return AppShimmer(
                                            shimmerWidget: Column(
                                              children: [
                                                Container(
                                                  height: MediaQuery.of(context).size.height*0.1,
                                                  width: MediaQuery.of(context).size.width*0.8,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: AppColors.primaryColor,
                                                  ),
                                                ),
                                                SizedBox(height: 10.h,),
                                                Container(
                                                  height: MediaQuery.of(context).size.height*0.1,
                                                  width: MediaQuery.of(context).size.width*0.8,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: AppColors.primaryColor,
                                                  ),
                                                )
                                              ],
                                            ),);
                                        }else if (provider.communityList!.isEmpty){
                                          return const Center(child: EmptyState(title: "Empty", subTitle: "There is no community list yet"));
                                        }else {
                                          return Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: ListView.separated(
                                              physics: const NeverScrollableScrollPhysics(),
                                                separatorBuilder: (context , index) {
                                                  return SizedBox(height: 15.h,);
                                                },
                                                shrinkWrap: true,
                                                itemCount: provider.communityList!.length,
                                                itemBuilder: (context , index) {
                                                  return Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          CircleAvatar(
                                                            radius: 30,
                                                            backgroundImage: NetworkImage(provider.communityList![index].image!),
                                                          ),
                                                          SizedBox(width: 10.w,),
                                                          Column(
                                                            children: [
                                                              appText(
                                                                  text: provider.communityList![index].name!,
                                                                  color: AppColors.primaryColor,
                                                                  fontSize: 20),
                                                              SizedBox(height: 2.h,),
                                                              appText(
                                                                  text: "${provider.communityList![index].time!} hours ago",
                                                                  color: AppColors.greyColor,
                                                                  fontSize: 18)
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(height: 10.h,),
                                                      Row(
                                                        children: [
                                                          appText(
                                                              text: "${provider.communityList![index].date!} : ",
                                                              color: AppColors.primaryColor,
                                                              fontSize: 20 ,
                                                          fontWeight: FontWeight.w700),
                                                          appText(
                                                              text: provider.communityList![index].title!,
                                                              color: AppColors.primaryColor,
                                                              fontSize: 20 ,
                                                              fontWeight: FontWeight.w700),
                                                        ],
                                                      ) ,
                                                      SizedBox(height: 2.h,),
                                                      const Divider(indent: 30 ,
                                                          endIndent: 30,
                                                      thickness: 0.5,
                                                      color: AppColors.primaryColor,) ,
                                                      SizedBox(height: 2.h,),
                                                        appTextFormField(
                                                            hint: "Write a comment ...",
                                                            icon: Icons.edit,
                                                            onChanged: (input){

                                                            },
                                                            validator: (input){

                                                            },
                                                            color: AppColors.greyColor,
                                                            controller: provider.controller)
                                                    ],
                                                  );
                                                }),
                                          );
                                        }
                                      }),
                                    ],
                                  ),
                                ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }else {
                          return Center(child: Text(provider.errorText),);
                        }
                      })
                ],
              ),
            ),
          ),
      ),
    );
  }
}
