


class SubCategory {
  final int id;
  String? name;
  String? name_arabic;
  String? image_url;
  int? parent_id;
  SubCategory({
    required this.id,
    this.name,
    this.name_arabic,
    this.image_url,
    this.parent_id,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["id"],
        name: json["name"],
        name_arabic: json["name_arabic"],
        image_url: json["image_url"],
        parent_id: json["parent_id"],

      );

}