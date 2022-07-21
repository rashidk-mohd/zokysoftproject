

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category {
  int? id;
  String? name;
  String? name_arabic;
  String? image_url;
  int? parent_id;
  int? IS_available_in_app;

  Category({
    this.id,
    this.name,
    this.name_arabic,
    this.image_url,
    this.parent_id,
    this.IS_available_in_app,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        name_arabic: json["name_arabic"],
        image_url: json["image_url"],
        parent_id: json["parent_id"],
        IS_available_in_app:json["IS_available_in_app"] 
      );

}