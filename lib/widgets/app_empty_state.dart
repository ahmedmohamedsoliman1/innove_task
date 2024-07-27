import 'package:flutter/cupertino.dart';

import '../core/app_colors.dart';
import '../core/app_images.dart';
import 'app_text.dart';

class EmptyState extends StatelessWidget {

  final String title ;
  final String subTitle ;

  const EmptyState ({super.key, required this.title , required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(image: const AssetImage(AppImages.empty)
          , width: MediaQuery.of(context).size.width*0.7,
          height: MediaQuery.of(context).size.height*0.2),
        const SizedBox(height: 10,) ,
        appText(text: title, fontSize: 18, color: AppColors.primaryColor,
            fontWeight: FontWeight.bold),
        const SizedBox(height: 10,),
        appText(text: subTitle,
            fontWeight: FontWeight.normal, color: AppColors.greyColor, fontSize: 14)
      ],
    );
  }
}