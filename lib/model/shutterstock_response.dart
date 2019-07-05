import 'shutterstock_model.dart';

class ShutterStockResponseModel {
  List<ShutterStockModel> data;
  int page;

  ShutterStockResponseModel({this.data, this.page});

  ShutterStockResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<ShutterStockModel>();
      json['data'].forEach((v) {
        data.add(new ShutterStockModel.fromJson(v));
      });
    } else {}
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
