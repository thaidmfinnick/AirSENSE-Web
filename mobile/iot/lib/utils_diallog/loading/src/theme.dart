import 'package:flutter/material.dart';

import './fox_loading.dart';
import './animations/animation.dart';
import './animations/opacity_animation.dart';
import './animations/offset_animation.dart';
import './animations/scale_animation.dart';

class FoxLoadingTheme {
  /// color of indicator
  static Color get indicatorColor =>
      FoxLoading.instance.loadingStyle == FoxLoadingStyle.custom
          ? FoxLoading.instance.indicatorColor
          : FoxLoading.instance.loadingStyle == FoxLoadingStyle.dark
              ? Colors.white
              : Colors.black;

  /// progress color of loading
  static Color get progressColor =>
      FoxLoading.instance.loadingStyle == FoxLoadingStyle.custom
          ? FoxLoading.instance.progressColor
          : FoxLoading.instance.loadingStyle == FoxLoadingStyle.dark
              ? Colors.white
              : Colors.black;

  /// background color of loading
  static Color get backgroundColor =>
      FoxLoading.instance.loadingStyle == FoxLoadingStyle.custom
          ? FoxLoading.instance.backgroundColor
          : FoxLoading.instance.loadingStyle == FoxLoadingStyle.dark
              ? Colors.black.withOpacity(0.9)
              : Colors.white;

  /// font color of status
  static Color get textColor =>
      FoxLoading.instance.loadingStyle == FoxLoadingStyle.custom
          ? FoxLoading.instance.textColor
          : FoxLoading.instance.loadingStyle == FoxLoadingStyle.dark
              ? Colors.white
              : Colors.black;

  /// mask color of loading
  static Color maskColor(FoxLoadingMaskType maskType) {
    FoxLoadingMaskType type = maskType ?? FoxLoading.instance.maskType;
    return type == FoxLoadingMaskType.custom
        ? FoxLoading.instance.maskColor
        : type == FoxLoadingMaskType.black
            ? Colors.black.withOpacity(0.5)
            : Colors.transparent;
  }

  /// loading animation
  static FoxLoadingAnimation get loadingAnimation {
    FoxLoadingAnimation _animation;
    switch (FoxLoading.instance.animationStyle) {
      case FoxLoadingAnimationStyle.custom:
        _animation = FoxLoading.instance.customAnimation;
        break;
      case FoxLoadingAnimationStyle.offset:
        _animation = OffsetAnimation();
        break;
      case FoxLoadingAnimationStyle.scale:
        _animation = ScaleAnimation();
        break;
      default:
        _animation = OpacityAnimation();
        break;
    }
    return _animation;
  }

  /// font size of status
  static double get fontSize => FoxLoading.instance.fontSize;

  /// size of indicator
  static double get indicatorSize => FoxLoading.instance.indicatorSize;

  /// width of progress indicator
  static double get progressWidth => FoxLoading.instance.progressWidth;

  /// width of indicator
  static double get lineWidth => FoxLoading.instance.lineWidth;

  /// loading indicator type
  static FoxLoadingIndicatorType get indicatorType =>
      FoxLoading.instance.indicatorType;

  /// toast position
  static FoxLoadingToastPosition get toastPosition =>
      FoxLoading.instance.toastPosition;

  /// toast position
  static AlignmentGeometry alignment(FoxLoadingToastPosition position) =>
      position == FoxLoadingToastPosition.bottom
          ? AlignmentDirectional.bottomCenter
          : (position == FoxLoadingToastPosition.top
              ? AlignmentDirectional.topCenter
              : AlignmentDirectional.center);

  /// display duration
  static Duration get displayDuration => FoxLoading.instance.displayDuration;

  /// animation duration
  static Duration get animationDuration =>
      FoxLoading.instance.animationDuration;

  /// contentPadding of loading
  static EdgeInsets get contentPadding => FoxLoading.instance.contentPadding;

  /// padding of status
  static EdgeInsets get textPadding => FoxLoading.instance.textPadding;

  /// textAlign of status
  static TextAlign get textAlign => FoxLoading.instance.textAlign;

  /// textStyle of status
  static TextStyle get textStyle => FoxLoading.instance.textStyle;

  /// radius of loading
  static double get radius => FoxLoading.instance.radius;

  /// should dismiss on user tap
  static bool get dismissOnTap => FoxLoading.instance.dismissOnTap;

  static bool ignoring(FoxLoadingMaskType maskType) {
    FoxLoadingMaskType type = maskType ?? FoxLoading.instance.maskType;
    return FoxLoading.instance.userInteractions ??
        (type == FoxLoadingMaskType.none ? true : false);
  }
}
