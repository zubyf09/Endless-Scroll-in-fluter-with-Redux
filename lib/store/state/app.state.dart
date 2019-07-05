import 'package:flutter/foundation.dart';
import 'shutterstock_state.dart';
class AppState {
  final ShutterStockState shutterStockState;

  AppState({
    @required this.shutterStockState,
  });

  AppState.initialState({shutterStockflowState})
      : shutterStockState =
      shutterStockflowState ?? ShutterStockState.initialState();
}
