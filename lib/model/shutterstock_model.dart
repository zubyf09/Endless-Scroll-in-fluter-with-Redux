class ShutterStockModel {
  String id;

  String description;
  Assets assets;

  ShutterStockModel({this.id, this.description, this.assets});

  ShutterStockModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];

    assets =
        json['assets'] != null ? new Assets.fromJson(json['assets']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['id'] = this.id;

    if (this.assets != null) {
      data['assets'] = this.assets.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

class Assets {
  Preview preview;

  Assets({
    this.preview,
  });

  Assets.fromJson(Map<String, dynamic> json) {
    preview =
        json['preview'] != null ? new Preview.fromJson(json['preview']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.preview != null) {
      data['preview'] = this.preview.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

class Preview {
  String url;

  Preview({
    this.url,
  });

  Preview.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
