import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:equatable/equatable.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState());

  StreamController connectionChangeController = new StreamController.broadcast();

  void onChangeConnectionStatus(ConnectivityResult result) async {
    if (result == ConnectivityResult.wifi || result == ConnectivityResult.mobile) {
      bool previousConnection = state.hasConnection;

      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          emit(state.copyWith(hasConnection: true));
        } else {
          emit(state.copyWith(hasConnection: false));
        }
      } on SocketException catch(_) {
        emit(state.copyWith(hasConnection: false));
      }

      //The connection status changed send out an update to all listeners
      if (previousConnection != state.hasConnection) {
        connectionChangeController.add(state.hasConnection);
      }
    }
  }

  void signOut() async {
   // GlobalData.instance.token = null;
    //TODO - Handle logout event
  }

  @override
  Future<void> close() {
    connectionChangeController.close();
    return super.close();
  }
}


class AppState extends Equatable {
  final String token;
  final bool hasConnection;

  AppState({
    this.token,
    this.hasConnection = false,
  });

  AppState copyWith({
    String token,
    bool hasConnection,
  }) {
    return AppState(
      token: token ?? this.token,
      hasConnection: hasConnection ?? this.hasConnection,
    );
  }

  @override
  List<Object> get props => [
    token,
    hasConnection,
  ];
}

