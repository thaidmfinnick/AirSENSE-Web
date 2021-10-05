import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';

class FoxConnectionStatus {
  //This creates the single instance by calling the `_internal` constructor specified
  static final FoxConnectionStatus _singleton = FoxConnectionStatus._internal();
  FoxConnectionStatus._internal();

  //Retrieve the instance through the app
  static FoxConnectionStatus get instance => _singleton;

  factory FoxConnectionStatus() => _singleton;

  //Tracks the current connection status
  bool hasConnection = false;

  //Subscribing to connection changes
  StreamController connectionChangeController = new StreamController.broadcast();

  //Init connectivity
  final Connectivity _connectivity = Connectivity();

  //Hook into connectivity's Stream to listen for changes and check the connection status out of the gate
  void initialize() {
    _connectivity.onConnectivityChanged.listen(_connectionChange);
    checkConnection();
  }

  Stream get connectionChange => connectionChangeController.stream;

  void dispose() {
    connectionChangeController.close();
  }

  //Connectivity's listener
  void _connectionChange(ConnectivityResult result) {
    checkConnection();
  }

  //The test to actually see if there is a connection
  Future<bool> checkConnection() async {
    bool previousConnection = hasConnection;

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        hasConnection = false;
      }
    } on SocketException catch(_) {
      hasConnection = false;
    }

    //The connection status changed send out an update to all listeners
    if (previousConnection != hasConnection) {
      connectionChangeController.add(hasConnection);
    }
    return hasConnection;
  }
}