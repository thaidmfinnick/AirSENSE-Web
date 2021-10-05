import 'package:flutter/material.dart';

import '../fox_loading.dart';
import './overlay_entry.dart';

class FlutterFoxLoading extends StatefulWidget {
  final Widget child;

  const FlutterFoxLoading({
    Key key,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  @override
  _FlutterFoxLoadingState createState() => _FlutterFoxLoadingState();
}

class _FlutterFoxLoadingState extends State<FlutterFoxLoading> {
  FoxLoadingOverlayEntry _overlayEntry;

  @override
  void initState() {
    super.initState();
    _overlayEntry = FoxLoadingOverlayEntry(
      builder: (BuildContext context) => FoxLoading.instance.w ?? Container(),
    );
    FoxLoading.instance.overlayEntry = _overlayEntry;
  }

  @override
  void dispose() {
    _overlayEntry = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Overlay(
        initialEntries: [
          FoxLoadingOverlayEntry(
            builder: (BuildContext context) => widget.child,
          ),
          _overlayEntry,
        ],
      ),
    );
  }
}
