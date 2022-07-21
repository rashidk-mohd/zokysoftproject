import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:zakysoftproject/models/product_model.dart';
import 'package:zakysoftproject/models/subcategory_model.dart';
import 'package:zakysoftproject/utls/apis.dart';
import 'dart:convert';

import '../models/category_model.dart';

class ProductProvider with ChangeNotifier {
  bool isFavorate = false;

  List<Category> category = [];
  List<SubCategory> subCategory = [];
  List<Product> products = [];
  int parent_id = 136;
  String catname = "VEGETABLES";
  String subName = "All";

  Future<void> fetchCategories() async {
    category = [];
    var url = Uri.parse(caturl);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List body = json.decode(response.body);
      body.forEach((element) {
        category.add(Category.fromJson(element));
      });
    }
  }

  Future<void> fetchSubCategories(
      {int id = 136, String name = "VEGETABLES"}) async {
    parent_id = id;
    catname = name;
    notifyListeners();
    subCategory = [SubCategory(id: 0, name: "All")];
    // String uri = "$subcaturl";
    String uri =
        "https://sta.farawlah.sa/api/mobile/subcategories?parent_id=$id";

    var url = Uri.parse(uri);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List body = json.decode(response.body);
      // print(body);
      body.forEach((element) {
        subCategory.add(SubCategory.fromJson(element));
      });
      notifyListeners();
    }
  }

  Future<void> fetchProducts({int catId = 0, String name = "All"}) async {
    subName = name;
    notifyListeners();
    products = [];
    String uri =
        "https://sta.farawlah.sa/api/mobile/products?parent_category_id=$parent_id&category_id=$catId&store_id=2&offset=0&limit=20&sort_by=sale_price&sort_type=DESC";
    var url = Uri.parse(uri);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List body = json.decode(response.body);
     // log(response.body);
      body.forEach((element) {
        products.add(Product.fromJson(element));
      });
      print(products.length);
      notifyListeners();
    }
  }

  void toggleFavorateStatus() {
    notifyListeners();
  }
}
