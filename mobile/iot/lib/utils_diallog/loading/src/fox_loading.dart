import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import './widgets/container.dart';
import './widgets/progress.dart';
import './widgets/indicator.dart';
import './widgets/overlay_entry.dart';
import './widgets/loading.dart';
import './animations/animation.dart';
import './theme.dart';

/// Initialize FoxLoading in your MaterialApp/CupertinoApp:
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter EasyLoading',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter EasyLoading'),
//       builder: FoxLoading.init(),
//     );
//   }
// }

///How to use
// FoxLoading.show(status: 'loading...');
// FoxLoading.showProgress(0.3, status: 'downloading...');
// FoxLoading.showSuccess('Great Success!');
// FoxLoading.showError('Failed with Error');
// FoxLoading.showInfo('Useful Information.');
// FoxLoading.showToast('Toast');
// FoxLoading.dismiss();

///Add loading status callback
// FoxLoading.addStatusCallback((status) {
// print('EasyLoading Status $status');
// });

///Remove loading status callback(s)
// FoxLoading.removeCallback(statusCallback);
// FoxLoading.removeAllCallbacks();

/// loading style
enum FoxLoadingStyle {
  light,
  dark,
  custom,
}

/// toast position
enum FoxLoadingToastPosition {
  top,
  center,
  bottom,
}

/// loading animation
enum FoxLoadingAnimationStyle {
  opacity,
  offset,
  scale,
  custom,
}

/// loading mask type
/// [none] default mask type, allow user interactions while loading is displayed
/// [clear] don't allow user interactions while loading is displayed
/// [black] don't allow user interactions while loading is displayed
/// [custom] while mask type is custom, maskColor should not be null
enum FoxLoadingMaskType {
  none,
  clear,
  black,
  custom,
}

/// loading indicator type. see [https://github.com/jogboms/flutter_spinkit#-showcase]
enum FoxLoadingIndicatorType {
  fadingCircle,
  circle,
  threeBounce,
  chasingDots,
  wave,
  wanderingCubes,
  rotatingPlain,
  doubleBounce,
  fadingFour,
  fadingCube,
  pulse,
  cubeGrid,
  rotatingCircle,
  foldingCube,
  pumpingHeart,
  dualRing,
  hourGlass,
  pouringHourGlass,
  fadingGrid,
  ring,
  ripple,
  spinningCircle,
  squareCircle,
}

/// loading status
enum FoxLoadingStatus {
  show,
  dismiss,
}

typedef FoxLoadingStatusCallback = void Function(FoxLoadingStatus status);

class FoxLoading {
  /// loading style, default [FoxLoadingStyle.dark].
  FoxLoadingStyle loadingStyle;

  /// loading indicator type, default [FoxLoadingIndicatorType.fadingCircle].
  FoxLoadingIndicatorType indicatorType;

  /// loading mask type, default [FoxLoadingMaskType.none].
  FoxLoadingMaskType maskType;

  /// toast position, default [FoxLoadingToastPosition.center].
  FoxLoadingToastPosition toastPosition;

  /// loading animationStyle, default [FoxLoadingAnimationStyle.opacity].
  FoxLoadingAnimationStyle animationStyle;

  /// loading custom animation, default null.
  FoxLoadingAnimation customAnimation;

  /// textAlign of status, default [TextAlign.center].
  TextAlign textAlign;

  /// textStyle of status, default null.
  TextStyle textStyle;

  /// content padding of loading.
  EdgeInsets contentPadding;

  /// padding of [status].
  EdgeInsets textPadding;

  /// size of indicator, default 40.0.
  double indicatorSize;

  /// radius of loading, default 5.0.
  double radius;

  /// fontSize of loading, default 15.0.
  double fontSize;

  /// width of progress indicator, default 2.0.
  double progressWidth;

  /// width of indicator, default 4.0, only used for [FoxLoadingIndicatorType.ring, FoxLoadingIndicatorType.dualRing].
  double lineWidth;

  /// display duration of [showSuccess] [showError] [showInfo] [showToast], default 2000ms.
  Duration displayDuration;

  /// animation duration of indicator, default 200ms.
  Duration animationDuration;

  /// color of loading status, only used for [FoxLoadingStyle.custom].
  Color textColor;

  /// color of loading indicator, only used for [FoxLoadingStyle.custom].
  Color indicatorColor;

  /// progress color of loading, only used for [FoxLoadingStyle.custom].
  Color progressColor;

  /// background color of loading, only used for [FoxLoadingStyle.custom].
  Color backgroundColor;

  /// mask color of loading, only used for [FoxLoadingMaskType.custom].
  Color maskColor;

  /// should allow user interactions while loading is displayed.
  bool userInteractions;

  /// should dismiss on user tap.
  bool dismissOnTap;

  /// indicator widget of loading
  Widget indicatorWidget;

  /// success widget of loading
  Widget successWidget;

  /// error widget of loading
  Widget errorWidget;

  /// info widget of loading
  Widget infoWidget;

  FoxLoadingOverlayEntry overlayEntry;
  Widget _w;

  GlobalKey<FoxLoadingContainerState> _key;
  GlobalKey<FoxLoadingProgressState> _progressKey;
  Timer _timer;

  Widget get w => _w;
  GlobalKey<FoxLoadingContainerState> get key => _key;
  GlobalKey<FoxLoadingProgressState> get progressKey => _progressKey;

  final List<FoxLoadingStatusCallback> _statusCallbacks =
      <FoxLoadingStatusCallback>[];

  factory FoxLoading() => _getInstance();
  static FoxLoading _instance;
  static FoxLoading get instance => _getInstance();

  FoxLoading._internal() {
    /// set deafult value
    loadingStyle = FoxLoadingStyle.dark;
    indicatorType = FoxLoadingIndicatorType.fadingCircle;
    maskType = FoxLoadingMaskType.none;
    toastPosition = FoxLoadingToastPosition.center;
    animationStyle = FoxLoadingAnimationStyle.opacity;
    textAlign = TextAlign.center;
    indicatorSize = 40.0;
    radius = 5.0;
    fontSize = 15.0;
    progressWidth = 2.0;
    lineWidth = 4.0;
    displayDuration = const Duration(milliseconds: 2000);
    animationDuration = const Duration(milliseconds: 200);
    textPadding = const EdgeInsets.only(bottom: 10.0);
    contentPadding = const EdgeInsets.symmetric(
      vertical: 15.0,
      horizontal: 20.0,
    );
  }

  static FoxLoading _getInstance() {
    if (_instance == null) _instance = FoxLoading._internal();
    return _instance;
  }

  static bool get isShow => _getInstance().w != null;

  /// init FoxLoading
  static TransitionBuilder init({
    TransitionBuilder builder,
  }) {
    return (BuildContext context, Widget child) {
      if (builder != null) {
        return builder(context, FlutterFoxLoading(child: child));
      } else {
        return FlutterFoxLoading(child: child);
      }
    };
  }

  /// show loading with [status] [indicator] [maskType]
  static Future<void> show({
    String status,
    Widget indicator,
    FoxLoadingMaskType maskType,
    bool dismissOnTap,
  }) {
    Widget w =
        indicator ?? (_getInstance().indicatorWidget ?? LoadingIndicator());
    return _getInstance()._show(
      status: status,
      maskType: maskType,
      dismissOnTap: dismissOnTap,
      w: w,
    );
  }

  /// show progress with [value] [status] [maskType], value should be 0.0 ~ 1.0.
  static Future<void> showProgress(
    double value, {
    String status,
    FoxLoadingMaskType maskType,
  }) async {
    assert(
      value >= 0.0 && value <= 1.0,
      'progress value should be 0.0 ~ 1.0',
    );

    if (_getInstance().loadingStyle == FoxLoadingStyle.custom) {
      assert(
        _getInstance().progressColor != null,
        'while loading style is custom, progressColor should not be null',
      );
    }

    if (_getInstance().w == null || _getInstance().progressKey == null) {
      if (_getInstance().key != null) await dismiss(animation: false);
      GlobalKey<FoxLoadingProgressState> _progressKey = GlobalKey<FoxLoadingProgressState>();

      Widget w = FoxLoadingProgress(
        key: _progressKey,
        value: value,
      );
      _getInstance()._show(
        status: status,
        maskType: maskType,
        dismissOnTap: false,
        w: w,
      );
      _getInstance()._progressKey = _progressKey;
    }
    // update progress
    _getInstance().progressKey?.currentState?.updateProgress(min(1.0, value));
    // update status
    if (status != null) _getInstance().key?.currentState?.updateStatus(status);
  }

  /// showSuccess [status] [duration] [maskType]
  static Future<void> showSuccess(
    String status, {
    Duration duration,
    FoxLoadingMaskType maskType,
    bool dismissOnTap,
  }) {
    Widget w = _getInstance().successWidget ??
        Icon(
          Icons.done,
          color: FoxLoadingTheme.indicatorColor,
          size: FoxLoadingTheme.indicatorSize,
        );
    return _getInstance()._show(
      status: status,
      duration: duration ?? FoxLoadingTheme,
      maskType: maskType,
      dismissOnTap: dismissOnTap,
      w: w,
    );
  }

  /// showError [status] [duration] [maskType]
  static Future<void> showError(
    String status, {
    Duration duration,
    FoxLoadingMaskType maskType,
    bool dismissOnTap,
  }) {
    Widget w = _getInstance().errorWidget ??
        Icon(
          Icons.clear,
          color: FoxLoadingTheme.indicatorColor,
          size: FoxLoadingTheme.indicatorSize,
        );
    return _getInstance()._show(
      status: status,
      duration: duration ?? FoxLoadingTheme.displayDuration,
      maskType: maskType,
      dismissOnTap: dismissOnTap,
      w: w,
    );
  }

  /// showInfo [status] [duration] [maskType]
  static Future<void> showInfo(
    String status, {
    Duration duration,
    FoxLoadingMaskType maskType,
    bool dismissOnTap,
  }) {
    Widget w = _getInstance().infoWidget ??
        Icon(
          Icons.info_outline,
          color: FoxLoadingTheme.indicatorColor,
          size: FoxLoadingTheme.indicatorSize,
        );
    return _getInstance()._show(
      status: status,
      duration: duration ?? FoxLoadingTheme.displayDuration,
      maskType: maskType,
      dismissOnTap: dismissOnTap,
      w: w,
    );
  }

  /// showToast [status] [duration] [toastPosition] [maskType]
  static Future<void> showToast(
    String status, {
    Duration duration,
    FoxLoadingToastPosition toastPosition,
    FoxLoadingMaskType maskType,
    bool dismissOnTap,
  }) {
    return _getInstance()._show(
      status: status,
      duration: duration ?? FoxLoadingTheme.displayDuration,
      toastPosition: toastPosition ?? FoxLoadingTheme.toastPosition,
      maskType: maskType,
      dismissOnTap: dismissOnTap,
    );
  }

  /// dismiss loading
  static Future<void> dismiss({
    bool animation = true,
  }) {
    // cancel timer
    _getInstance()._cancelTimer();
    return _getInstance()._dismiss(animation);
  }

  /// add loading status callback
  static void addStatusCallback(FoxLoadingStatusCallback callback) {
    if (!_getInstance()._statusCallbacks.contains(callback)) {
      _getInstance()._statusCallbacks.add(callback);
    }
  }

  /// remove single loading status callback
  static void removeCallback(FoxLoadingStatusCallback callback) {
    if (_getInstance()._statusCallbacks.contains(callback)) {
      _getInstance()._statusCallbacks.remove(callback);
    }
  }

  /// remove all loading status callback
  static void removeAllCallbacks() {
    _getInstance()._statusCallbacks.clear();
  }

  /// show [status] [duration] [toastPosition] [maskType]
  Future<void> _show({
    Widget w,
    String status,
    Duration duration,
    FoxLoadingToastPosition toastPosition = FoxLoadingToastPosition.center,
    FoxLoadingMaskType maskType,
    bool dismissOnTap,
  }) async {
    assert(
      overlayEntry != null,
      'overlayEntry should not be null',
    );

    assert(
      toastPosition != null,
      'toastPosition should not be null',
    );

    if (loadingStyle == FoxLoadingStyle.custom) {
      assert(
        backgroundColor != null,
        'while loading style is custom, backgroundColor should not be null',
      );
      assert(
        indicatorColor != null,
        'while loading style is custom, indicatorColor should not be null',
      );
      assert(
        textColor != null,
        'while loading style is custom, textColor should not be null',
      );
    }

    if (maskType == null) maskType = _getInstance().maskType;
    assert(
      maskType != null,
      'maskType should not be null',
    );

    if (maskType == FoxLoadingMaskType.custom) {
      assert(
        maskColor != null,
        'while mask type is custom, maskColor should not be null',
      );
    }

    if (animationStyle == FoxLoadingAnimationStyle.custom) {
      assert(
        customAnimation != null,
        'while animationStyle is custom, customAnimation should not be null',
      );
    }

    bool animation = _w == null;
    _progressKey = null;
    if (_key != null) await dismiss(animation: false);

    Completer<void> completer = Completer<void>();
    _key = GlobalKey<FoxLoadingContainerState>();
    _w = FoxLoadingContainer(
      key: _key,
      status: status,
      indicator: w,
      animation: animation,
      toastPosition: toastPosition,
      maskType: maskType,
      dismissOnTap: dismissOnTap,
      completer: completer,
    );
    completer.future.whenComplete(() {
      _callback(FoxLoadingStatus.show);
      if (duration != null) {
        _cancelTimer();
        _timer = Timer.periodic(duration, (timer) async {
          await dismiss();
          _cancelTimer();
        });
      }
    });
    _markNeedsBuild();
    return completer.future;
  }

  Future<void> _dismiss(bool animation) async {
    if (key != null && key.currentState == null) {
      _reset();
      return;
    }

    return key?.currentState?.dismiss(animation)?.whenComplete(() {
      _reset();
    });
  }

  void _reset() {
    _w = null;
    _key = null;
    _progressKey = null;
    _cancelTimer();
    _markNeedsBuild();
    _callback(FoxLoadingStatus.dismiss);
  }

  void _callback(FoxLoadingStatus status) {
    for (final FoxLoadingStatusCallback callback in _statusCallbacks) {
      if (callback != null) callback(status);
    }
  }

  void _markNeedsBuild() {
    overlayEntry?.markNeedsBuild();
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }
}
