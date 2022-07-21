class Product {
  String? name;
  int? id;
  String? name_arabic;
  int? category_id;
  int? brand_id;
  String? rating;
  int? is_in_wish_list_count;
  int? ratings_count;
  num? sort_price;
  Map<String, dynamic>? category;
  Map<String, dynamic>? cart_summaries;
  dynamic offers;
  Price? price;
  Map<String, dynamic>? inventory;
  List<dynamic>? images;
  List<dynamic>? tags;
  Map<String, dynamic>? storages;
  Product({
    this.id,
    this.name,
    this.name_arabic,
    this.category_id,
    this.brand_id,
    this.rating,
    this.is_in_wish_list_count,
    this.ratings_count,
    this.sort_price,
    this.category,
    this.cart_summaries,
    this.offers,
    this.inventory,
    this.images,
    this.price,
    this.storages,
    this.tags

  });
 factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        name_arabic: json["name_arabic"],
        category_id:json["category_id"],
        brand_id:json["brand_id"],
        rating:json["rating"],
        is_in_wish_list_count:json["is_in_wish_list_count"],
        ratings_count:json["ratings_count"],
         sort_price:json["sort_price"],
         category:json["category"],
         cart_summaries:json["cart_summaries"],
         offers:json["offers"],
         price:Price.fromJson(json["price"]),
         inventory:json["inventory"],
         images:json["images"],
         tags: json["tags"],
         storages:json["storages"]);   
}


class Price {
  int? id;
  int? product_id;
  num? sale_price;
  int? tax_id;
  Map<dynamic,dynamic>? tax;
  Price({
    required this.id,
    required this.product_id,
    required this.sale_price,
    required this.tax_id,
    required this.tax,
  });
  factory Price.fromJson(Map<String, dynamic> json) => 
  Price(
    id: json["id"], 
    product_id: json["product_id"], 
    sale_price: json["sale_price"], 
    tax_id: json["tax_id"], 
    tax: json["tax"]);
  // "tax":{"id":1,"name":" VAT 15 Price included","name_arabic":" VAT 15 Price included","rate":15,"IS_price_include":1}
}