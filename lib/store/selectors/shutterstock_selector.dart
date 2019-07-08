
import 'package:upday_assignment/model/shutterstock_model.dart';
import 'package:upday_assignment/store/state/shutterstock_state.dart';
import 'package:reselect/reselect.dart';

//For search Purpose
final alImageSelector = (ShutterStockState state) => state.images;
final filterBySelector = (ShutterStockState state) => state.searchText;

final imagesByFilterSelector = createSelector2(
    alImageSelector,
    filterBySelector,
    (List<ShutterStockModel> images, String filterBy) => images.where(
          (data) =>
              filterBy.length == 0 ||
                  data.description.contains(filterBy),
        ));
