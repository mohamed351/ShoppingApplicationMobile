import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_app/models/product.dart';
import "package:http/http.dart" as http;

class ProductProvider with ChangeNotifier {
  ProductList _products = null;
  int recordsFiltered = 0;
  int recordsTotal = 0;

  ProductList get products {
    return _products;
  }

  Future<void> getProducts() async {
    var request =
        await http.get("https://localhost:9097/api/Products?start=0&length=20");
    _products = jsonToproductList(request.body);
    recordsTotal = _products.metaData.recordsTotal;
    recordsFiltered = 20;
    notifyListeners();
  }
}
