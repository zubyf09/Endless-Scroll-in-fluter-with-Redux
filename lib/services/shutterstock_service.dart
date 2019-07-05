import 'package:upday_assignment/model/shutterstock_response.dart';
import 'web_client.dart';
import 'package:upday_assignment/constants/api.dart';


class ShutterStockService {
  Future<ShutterStockResponseModel> list([int page = 1]) async {
    var query = {
      'page': page,
      'pagesize': Api.pageSize,

    };
    var response = await http.get(Api.shutterStockImages, query);



    return ShutterStockResponseModel.fromJson(response);
  }
}
