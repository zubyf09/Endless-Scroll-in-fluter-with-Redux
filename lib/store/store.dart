import 'package:upday_assignment/store/state/app.state.dart';
import 'package:upday_assignment/store/state/shutterstock_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upday_assignment/store/reducers/reducer.dart';
import 'package:upday_assignment/store/middlewares/shutterstock_middleware.dart';

Future<Store<AppState>> createStore() async {

  var midlewares = middlewares()
    ..addAll([new LoggingMiddleware.printer()]);

  return Store(
    rootReducer,
    initialState: AppState.initialState(
      shutterStockflowState: ShutterStockState.initialState(),
    ),

    middleware: midlewares,
  );
}
