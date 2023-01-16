class FocusModel {
  FocusModel({
    required this.result,
  });
  late final List<FocusItem> result;

  FocusModel.fromJson(Map<String, dynamic> json) {
    result = List.from(json['result']).map((e) => FocusItem.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['result'] = result.map((e) => e.toJson()).toList();
    return _data;
  }
}

class FocusItem {
  FocusItem({
    required this.id,
    required this.title,
    required this.status,
    required this.pic,
    required this.url,
    required this.position,
  });
  late final String id;
  late final String title;
  late final String status;
  late final String pic;
  late final String url;
  late final int position;

  FocusItem.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    status = json['status'];
    pic = json['pic'];
    url = json['url'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['title'] = title;
    _data['status'] = status;
    _data['pic'] = pic;
    _data['url'] = url;
    _data['position'] = position;
    return _data;
  }
}
