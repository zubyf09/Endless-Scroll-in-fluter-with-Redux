import 'package:upday_assignment/store/actions/shutterstock_action.dart';
import 'package:upday_assignment/store/state/shutterstock_state.dart';
import 'package:redux/redux.dart';
import 'package:uuid/uuid.dart';

String uuid() => new Uuid().v1();

ShutterStockState loadImages(
    ShutterStockState state, LoadImagesAction action) {
  return state.copyWith(
    
    l: action.paginate ? false : true,
    paginate: action.paginate,
    uuid: uuid(),
    // reset page if use RefreshIndicator or first loadind
    page: action.paginate ? state.page : 1,
  );
}

ShutterStockState loadImagesSuccess(
    ShutterStockState state, LoadImagesSuccessAction action) {
  return state.copyWith(
    l: false,
    // if pagination its actived i include the new items to the existing
    q: [
      if (action.paginate) ...state.images,
      ...action.images,
    ],
    page:  state.page + 1,
    // forcing  to change the state and execute StoreConector builder function
    uuid: uuid(),
    paginate: false,
  );
}

ShutterStockState viewImage(
    ShutterStockState state, ViewImageAction action) {
  return state.copyWith(s: action.image);
}
// Update store with the new search text.
ShutterStockState filterByQuery(
    ShutterStockState state, SearchByAction action) {
  return state.copyWith(
    // forcing  to change the state and execute StoreConector builder function
    uuid: uuid(),
    searchText: action.searchText,
  );
}

final Reducer<ShutterStockState> shutterStockReducer = combineReducers<ShutterStockState>([
  new TypedReducer<ShutterStockState, LoadImagesSuccessAction>(
      loadImagesSuccess),
  new TypedReducer<ShutterStockState, LoadImagesAction>(loadImages),
  new TypedReducer<ShutterStockState, ViewImageAction>(viewImage),
  new TypedReducer<ShutterStockState, SearchByAction>(filterByQuery),
]);
