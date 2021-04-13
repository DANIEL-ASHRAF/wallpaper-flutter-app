class CategoryModel {
  CategoryModel({
    this.categoryName,
    this.imageUrl,
  });

  String? categoryName;
  String? imageUrl;
//
//  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
//    categoryName: json["categoryName"],
//    imageUrl: json["imageUrl"],
//  );
//
//  Map<String, dynamic> toJson() => {
//    "categoryName": categoryName,
//    "imageUrl": imageUrl,
//  };
}
