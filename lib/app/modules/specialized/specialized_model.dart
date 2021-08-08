class Specialized {
  String des;
  int id;
  String image;
  String name;
  String updatedAT;
  String urlGetJsonDetail;
  int view;

  Specialized(
      {this.des,
      this.id,
      this.image,
      this.name,
      this.updatedAT,
      this.urlGetJsonDetail,
      this.view});

  Specialized.fromJson(Map<String, dynamic> json) {
    des = json['des'];
    id = json['id'];
    image = json['image'];
    name = json['name'];
    updatedAT = json['updatedAT'];
    urlGetJsonDetail = json['urlGetJsonDetail'];
    view = json['view'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['des'] = des;
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['updatedAT'] = updatedAT;
    data['urlGetJsonDetail'] = urlGetJsonDetail;
    data['view'] = view;
    return data;
  }
}
