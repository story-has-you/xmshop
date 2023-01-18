class PlistModel {
  PlistModel({
    required this.result,
  });
  late final List<PlistItem> result;

  PlistModel.fromJson(Map<String, dynamic> json) {
    result = List.from(json['result']).map((e) => PlistItem.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['result'] = result.map((e) => e.toJson()).toList();
    return _data;
  }
}

class PlistItem {
  PlistItem({
    required this.id,
    required this.title,
    required this.cid,
    required this.price,
    required this.pic,
    required this.subTitle,
    required this.sPic,
  });
  late final String id;
  late final String title;
  late final String cid;
  late final int price;
  late final String pic;
  late final String subTitle;
  late final String sPic;

  PlistItem.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    cid = json['cid'];
    price = json['price'];
    pic = json['pic'];
    subTitle = json['sub_title'];
    sPic = json['s_pic'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['title'] = title;
    _data['cid'] = cid;
    _data['price'] = price;
    _data['pic'] = pic;
    _data['sub_title'] = subTitle;
    _data['s_pic'] = sPic;
    return _data;
  }
}
