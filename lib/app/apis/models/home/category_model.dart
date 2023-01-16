class CategoryModel {
  CategoryModel({
    required this.result,
  });
  late final List<CategoryItem> result;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    result = List.from(json['result']).map((e) => CategoryItem.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['result'] = result.map((e) => e.toJson()).toList();
    return _data;
  }
}

class CategoryItem {
  CategoryItem({
    required this.id,
    required this.title,
    required this.status,
    required this.pic,
    required this.pid,
    required this.sort,
    required this.isBest,
    required this.goProduct,
    required this.productId,
  });
  late final String id;
  late final String title;
  late final int status;
  late final String pic;
  late final String pid;
  late final int sort;
  late final int isBest;
  late final int goProduct;
  late final String productId;

  CategoryItem.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    status = json['status'];
    pic = json['pic'];
    pid = json['pid'];
    sort = json['sort'];
    isBest = json['is_best'];
    goProduct = json['go_product'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['title'] = title;
    _data['status'] = status;
    _data['pic'] = pic;
    _data['pid'] = pid;
    _data['sort'] = sort;
    _data['is_best'] = isBest;
    _data['go_product'] = goProduct;
    _data['product_id'] = productId;
    return _data;
  }
}
