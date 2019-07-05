import 'package:upday_assignment/services/shutterstock_service.dart';
import 'package:upday_assignment/store/actions/shutterstock_action.dart';
import 'package:upday_assignment/store/state/app.state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> middlewares() {
  final ShutterStockService service = new ShutterStockService();

  final loadRequest = _createRequest(service);

  return ([
    TypedMiddleware<AppState, LoadImagesAction>(loadRequest),
  ]);
}

Middleware<AppState> _createRequest(ShutterStockService service) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    try {

      next(action);
      var response = await service.list(store.state.shutterStockState.page);
      store.dispatch(
        new LoadImagesSuccessAction(
          images: response.data,
          paginate: action.paginate,

        ),
      );
    } catch (error) {
      print("Error info new: "+error.toString());
      store.dispatch(new LoadImagesFailureAction(error: error));
    }

  };
}

