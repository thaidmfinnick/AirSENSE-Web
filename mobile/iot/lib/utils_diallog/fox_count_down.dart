import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FoxCountdown extends StatefulWidget {
  final Duration duration;
  final Duration interval;
  final void Function() onFinish;
  final Widget Function(BuildContext context, Duration remaining) builder;

  const FoxCountdown({
    Key key,
    @required this.duration,
    @required this.builder,
    this.onFinish,
    this.interval = const Duration(seconds: 1),
  }) : super(key: key);

  @override
  _FoxCountdownState createState() => _FoxCountdownState();
}

class _FoxCountdownState extends State<FoxCountdown> {
  Timer _timer;
  Duration _duration;

  @override
  void initState() {
    _duration = widget.duration;
    startTimer();

    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(widget.interval, timerCallback);
  }

  void timerCallback(Timer timer) {
    if (_duration == null) {
      timer.cancel();
      return;
    }
    setState(() {
      if (_duration.inSeconds == 0) {
        timer.cancel();
        if (widget.onFinish != null) widget.onFinish();
      } else {
        _duration = Duration(seconds: _duration.inSeconds - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _duration);
  }
}

class DxCountdownFormatted extends StatelessWidget {
  final Duration duration;
  final Duration interval;
  final void Function() onFinish;
  final String Function(Duration) formatter;
  final Widget Function(BuildContext context, String remaining) builder;

  const DxCountdownFormatted({
    Key key,
    @required this.duration,
    @required this.builder,
    this.onFinish,
    this.interval = const Duration(seconds: 1),
    this.formatter,
  }) : super(key: key);

  Function(Duration) _formatter() {
    if (formatter != null) return formatter;
    if (duration.inHours >= 1) return formatByHours;
    if (duration.inMinutes >= 1) return formatByMinutes;

    return formatBySeconds;
  }

  @override
  Widget build(BuildContext context) {
    return FoxCountdown(
      interval: interval,
      onFinish: onFinish,
      duration: duration,
      builder: (BuildContext ctx, Duration remaining) {
        return builder(ctx, _formatter()(remaining));
      },
    );
  }
}

String twoDigits(int n) {
  if (n >= 10) return '$n';
  return '0$n';
}

String formatBySeconds(Duration duration) => twoDigits(duration.inSeconds.remainder(60));

String formatByMinutes(Duration duration) {
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  return '$twoDigitMinutes:${formatBySeconds(duration)}';
}

String formatByHours(Duration duration) {
  return '${twoDigits(duration.inHours)}:${formatByMinutes(duration)}';
}

String formatByDays(Duration duration) {}

String formatByAll(Duration remaining) {
  String content = 'Còn ';
  if(remaining == null){
    return 'Hết thời gian đăng kí';
  }

  if (remaining.inSeconds > 0) {
    if ((remaining.inMinutes / 1440) > 1) {
      var days = (remaining.inMinutes / 1440).round();
      content += '$days ngày ';
      var remainMin = remaining.inMinutes % 1440;
      if ((remainMin / 60) > 1) {
        var hours = (remainMin / 60).round();
        var last = remainMin % 60;
        content += '$hours giờ $last phút ';
      } else {
        content += '$remainMin phút ';
      }
    } else {
      if ((remaining.inMinutes / 60) > 1) {
        var hours = (remaining.inMinutes / 60).round();
        var remainMin = remaining.inMinutes % 60;
        content += '$hours giờ $remainMin phút ';
      } else {
        content += '${remaining.inMinutes} phút ';
      }
    }
    content += '${remaining.inSeconds.remainder(60)} giây';
  } else {
    content = 'Hết thời gian đăng kí';
  }
  return content;
}
