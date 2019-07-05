import 'package:upday_assignment/store/state/app.state.dart';
import 'shutterstock_reducer.dart';

AppState rootReducer(AppState state, action) {
  return AppState(
    shutterStockState: shutterStockReducer(state.shutterStockState, action),
  );
}
