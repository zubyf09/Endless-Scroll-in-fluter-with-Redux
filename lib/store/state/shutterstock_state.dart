import 'package:upday_assignment/model/shutterstock_model.dart';

class ShutterStockState {

  final List<ShutterStockModel> images;
  final ShutterStockModel selected;
  final bool loading;

  final bool paginate;
  final int page;

  // to force the change of state
  final String uuid;

  final String searchText;

  ShutterStockState({
    this.images,
    this.selected,
    this.loading,
    this.page,
    this.paginate,
    this.uuid,
    this.searchText,
  });

  ShutterStockState.initialState()
      : images = List.unmodifiable([]),
        selected = null,
        loading = false,
        paginate = false,
        page = 1,
        uuid = '',
        searchText = '';

  ShutterStockState copyWith(
          {q, s, l, paginate,uuid, page, searchText}) =>
      new ShutterStockState(
        images: q ?? this.images,
        selected: s ?? this.selected,
        loading: l ?? this.loading,
        paginate: paginate ?? this.paginate,

        uuid: uuid ?? this.uuid,
        page: page ?? this.page,
        searchText: searchText ?? this.searchText,
      );
}
