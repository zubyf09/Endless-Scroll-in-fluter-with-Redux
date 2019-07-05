import 'package:flutter/foundation.dart';
import 'package:upday_assignment/model/shutterstock_model.dart';

class LoadImagesAction {
  final bool paginate;
  LoadImagesAction({this.paginate});
}

class LoadImagesSuccessAction {
  final List<ShutterStockModel> images;
  final bool paginate;


  LoadImagesSuccessAction({
    @required this.images,
    this.paginate,

  });
}

class LoadImagesFailureAction {
  final dynamic error;
  LoadImagesFailureAction({@required this.error});
}

class ViewImageAction {
  final ShutterStockModel image;

  ViewImageAction({@required this.image});
}

class SearchByAction {
  final String searchText;
  SearchByAction({this.searchText});
}
