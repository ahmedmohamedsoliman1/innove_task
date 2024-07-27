import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../core/app_colors.dart';

Widget appIndicatorLoading () {
  return SizedBox(
    width: 30.w,
    height: 30.h,
    child: const LoadingIndicator(
        indicatorType: Indicator.lineSpinFadeLoader, /// Required, The loading type of the widget
        colors: [AppColors.primaryColor],       /// Optional, The color collections
        strokeWidth: 2,
        pathBackgroundColor: Colors.black   /// Optional, the stroke backgroundColor
    ),
  );
}