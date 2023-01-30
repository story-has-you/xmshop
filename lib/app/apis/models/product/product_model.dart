class ProductDetailModel {
  ProductDetailModel({
    required this.result,
  });
  late final ProductDetail result;

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    result = ProductDetail.fromJson(json['result']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['result'] = result.toJson();
    return _data;
  }
}

class ProductDetail {
  ProductDetail({
    this.id,
    this.title,
    this.cid,
    this.price,
    this.oldPrice,
    this.isBest,
    this.isHot,
    this.isNew,
    this.status,
    this.pic,
    this.content,
    this.cname,
    this.attr,
    this.subTitle,
    this.salecount,
    this.specs,
  });
  String? id;
  String? title;
  String? cid;
  int? price;
  int? oldPrice;
  int? isBest;
  int? isHot;
  int? isNew;
  int? status;
  String? pic;
  String? content;
  String? cname;
  List<Attr>? attr;
  String? subTitle;
  int? salecount;
  String? specs;

  ProductDetail.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    cid = json['cid'];
    price = json['price'];
    oldPrice = json['old_price'];
    isBest = json['is_best'];
    isHot = json['is_hot'];
    isNew = json['is_new'];
    status = json['status'];
    pic = json['pic'];
    content = json['content'];
    cname = json['cname'];
    attr = List.from(json['attr']).map((e) => Attr.fromJson(e)).toList();
    subTitle = json['sub_title'];
    salecount = json['salecount'];
    specs = json['specs'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['title'] = title;
    _data['cid'] = cid;
    _data['price'] = price;
    _data['old_price'] = oldPrice;
    _data['is_best'] = isBest;
    _data['is_hot'] = isHot;
    _data['is_new'] = isNew;
    _data['status'] = status;
    _data['pic'] = pic;
    _data['content'] = content;
    _data['cname'] = cname;
    _data['attr'] = attr?.map((e) => e.toJson()).toList();
    _data['sub_title'] = subTitle;
    _data['salecount'] = salecount;
    _data['specs'] = specs;
    return _data;
  }
}

class Attr {
  Attr({
    required this.cate,
    required this.list,
  });
  late final String cate;
  late final List<String> list;

  Attr.fromJson(Map<String, dynamic> json) {
    cate = json['cate'];
    list = List.castFrom<dynamic, String>(json['list']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cate'] = cate;
    _data['list'] = list;
    return _data;
  }
}
