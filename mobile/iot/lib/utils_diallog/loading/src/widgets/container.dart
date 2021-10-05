import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../theme.dart';
import '../fox_loading.dart';

class FoxLoadingContainer extends StatefulWidget {
  final Widget indicator;
  final String status;
  final bool animation;
  final bool dismissOnTap;
  final FoxLoadingToastPosition toastPosition;
  final FoxLoadingMaskType maskType;
  final Completer<void> completer;

  const FoxLoadingContainer({
    Key key,
    this.indicator,
    this.status,
    this.animation = true,
    this.dismissOnTap,
    this.toastPosition,
    this.maskType,
    this.completer,
  }) : super(key: key);

  @override
  FoxLoadingContainerState createState() => FoxLoadingContainerState();
}

class FoxLoadingContainerState extends State<FoxLoadingContainer>
    with SingleTickerProviderStateMixin {
  String _status;
  AlignmentGeometry _alignment;
  bool _dismissOnTap, _ignoring;
  Color _maskColor;
  AnimationController _animationController;

  bool get isPersistentCallbacks => SchedulerBinding.instance.schedulerPhase == SchedulerPhase.persistentCallbacks;

  @override
  void initState() {
    super.initState();
    if (!mounted) return;
    _status = widget.status;
    _alignment = (widget.indicator == null && widget.status?.isNotEmpty == true)
        ? FoxLoadingTheme.alignment(widget.toastPosition)
        : AlignmentDirectional.center;
    _dismissOnTap =
        widget.dismissOnTap ?? (FoxLoadingTheme.dismissOnTap ?? false);
    _ignoring =
        _dismissOnTap ? false : FoxLoadingTheme.ignoring(widget.maskType);
    _maskColor = FoxLoadingTheme.maskColor(widget.maskType);
    _animationController = AnimationController(
      vsync: this,
      duration: FoxLoadingTheme.animationDuration,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed &&
            !widget.completer.isCompleted) {
          widget.completer?.complete();
        }
      });
    show(widget.animation);
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _animationController = null;
    super.dispose();
  }

  Future<void> show(bool animation) {
    if (isPersistentCallbacks) {
      Completer<void> completer = Completer<void>();
      SchedulerBinding.instance.addPostFrameCallback((_) => completer
          .complete(_animationController?.forward(from: animation ? 0 : 1)));
      return completer.future;
    } else {
      return _animationController?.forward(from: animation ? 0 : 1);
    }
  }

  Future<void> dismiss(bool animation) {
    if (isPersistentCallbacks) {
      Completer<void> completer = Completer<void>();
      SchedulerBinding.instance.addPostFrameCallback((_) => completer
          .complete(_animationController?.reverse(from: animation ? 1 : 0)));
      return completer.future;
    } else {
      return _animationController?.reverse(from: animation ? 1 : 0);
    }
  }

  void updateStatus(String status) {
    if (_status == status) return;
    setState(() {
      _status = status;
    });
  }

  void _onTap() async {
    if (_dismissOnTap) await FoxLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: _alignment,
      children: <Widget>[
        AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context, Widget child) {
            return Opacity(
              opacity: _animationController?.value ?? 0,
              child: IgnorePointer(
                ignoring: _ignoring,
                child: _dismissOnTap
                    ? GestureDetector(
                        onTap: _onTap,
                        behavior: HitTestBehavior.translucent,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: _maskColor,
                        ),
                      )
                    : Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: _maskColor,
                      ),
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context, Widget child) {
            return FoxLoadingTheme.loadingAnimation?.buildWidget(
              _Indicator(
                status: _status,
                indicator: widget.indicator,
              ),
              _animationController,
              _alignment,
            );
          },
        ),
      ],
    );
  }
}

class _Indicator extends StatelessWidget {
  final Widget indicator;
  final String status;

  const _Indicator({
    @required this.indicator,
    @required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(50.0),
      decoration: BoxDecoration(
        color: FoxLoadingTheme.backgroundColor,
        borderRadius: BorderRadius.circular(
          FoxLoadingTheme.radius,
        ),
      ),
      padding: FoxLoadingTheme.contentPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          indicator != null
              ? Container(
                  margin: status?.isNotEmpty == true
                      ? FoxLoadingTheme.textPadding
                      : EdgeInsets.zero,
                  child: indicator,
                )
              : null,
          status?.isNotEmpty == true
              ? Text(
                  status,
                  style: FoxLoadingTheme.textStyle ??
                      TextStyle(
                        color: FoxLoadingTheme.textColor,
                        fontSize: FoxLoadingTheme.fontSize,
                      ),
                  textAlign: FoxLoadingTheme.textAlign,
                )
              : null,
        ].where((w) => w != null).toList(),
      ),
    );
  }
}
