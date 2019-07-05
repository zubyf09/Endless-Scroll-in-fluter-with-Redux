import 'package:upday_assignment/model/shutterstock_model.dart';
import 'package:upday_assignment/store/actions/shutterstock_action.dart';
import 'package:upday_assignment/store/selectors/shutterstock_selector.dart';
import 'package:redux/redux.dart';
import 'package:upday_assignment/store/state/app.state.dart';
import 'package:upday_assignment/store/state/shutterstock_state.dart';

class ShutterStockViewModel {

  final ShutterStockState state;
  final List<ShutterStockModel> images;

  final Function(ShutterStockModel) onView;
  final Function onLoad;

  ShutterStockViewModel({
    this.state,
    this.onView,
    this.onLoad,
    this.images,
  });

  static ShutterStockViewModel fromStore(Store<AppState> store) {
    return new ShutterStockViewModel(
      state: store.state.shutterStockState,
      images: imagesByFilterSelector(store.state.shutterStockState).toList(),
      onView: (img) => store.dispatch(
        new ViewImageAction(image: img),
      ),
      onLoad: () => store.dispatch(
        new LoadImagesAction(paginate: false),
      ),
    );
  }

  // method to check if the state changed
  @override
  int get hashCode => state.uuid.hashCode;

  bool operator ==(other) {
    bool result = identical(this, other) || other is ShutterStockViewModel;

    if (result) {
      if (state.uuid != (other as ShutterStockViewModel).state.uuid) {
        return false;
      }
    }

    return result;
  }
}
