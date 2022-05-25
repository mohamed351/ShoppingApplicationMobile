import 'dart:convert';

ProductList jsonToproductList(String str) =>
    ProductList.fromJson(json.decode(str));

String productListToJson(ProductList data) => json.encode(data.toJson());

class ProductList {
  ProductList({
    this.data,
    this.metaData,
  });

  List<Datum> data;
  MetaData metaData;

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        metaData: MetaData.fromJson(json["metaData"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "metaData": metaData.toJson(),
      };
}

class Datum {
  Datum({
    this.productId,
    this.productNameEnglish,
    this.productNameArabic,
    this.descriptionArabic,
    this.descriptionEnglish,
    this.cateogryId,
    this.imageUrl,
  });

  int productId;
  String productNameEnglish;
  String productNameArabic;
  String descriptionArabic;
  String descriptionEnglish;
  int cateogryId;
  String imageUrl;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        productId: json["productID"],
        productNameEnglish: json["productNameEnglish"],
        productNameArabic: json["productNameArabic"],
        descriptionArabic: json["descriptionArabic"],
        descriptionEnglish: json["descriptionEnglish"],
        cateogryId: json["cateogryID"],
        imageUrl: json["imageURL"],
      );

  Map<String, dynamic> toJson() => {
        "productID": productId,
        "productNameEnglish": productNameEnglish,
        "productNameArabic": productNameArabic,
        "descriptionArabic": descriptionArabic,
        "descriptionEnglish": descriptionEnglish,
        "cateogryID": cateogryId,
        "imageURL": imageUrl,
      };
}

class MetaData {
  MetaData({
    this.recordsFiltered,
    this.recordsTotal,
  });

  int recordsFiltered;
  int recordsTotal;

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        recordsFiltered: json["recordsFiltered"],
        recordsTotal: json["recordsTotal"],
      );

  Map<String, dynamic> toJson() => {
        "recordsFiltered": recordsFiltered,
        "recordsTotal": recordsTotal,
      };
}
