import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppDimens {
  AppDimens._(); // this basically makes it so you can instantiate this class

  //TextFontSize
  static const double fontSmallest = 10.0;
  static const double fontSmaller = 11.0;
  static const double fontSmall = 12.0;
  static const double fontNormal = 14.0;
  static const double fontLarge = 16.0;
  static const double fontLarger = 17.0;
  static const double fontLargest = 18.0;

  //Common
  static const double appBarHeight = 48.0;
}

class AppGradient {
  static final linearGradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [Colors.pink[500], Colors.pink[200]], //Flutter bug
  );
}

class AppImages {
  static final icLogo = '';
}

class AppShadow {
  static final boxShadow = [
    BoxShadow(
      color: AppColors.shadowColor,
      blurRadius: 5,
      offset: Offset(0, 0),
    ),
  ];
}
