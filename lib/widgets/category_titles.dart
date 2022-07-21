import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zakysoftproject/utls/colors.dart';
import '../providers/product_providers.dart';

class CategoryTitles extends StatefulWidget {
  const CategoryTitles({Key? key}) : super(key: key);

  @override
  State<CategoryTitles> createState() => _CategoryTitlesState();
}

class _CategoryTitlesState extends State<CategoryTitles> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: Consumer<ProductProvider>(
        builder: (context, value, child) => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: value.category.length,
          itemBuilder: (context, index) {
            final category = value.category[index];
            return titlecontainer(category.name!, category.id);
          },
        ),
      ),
    );
  }

  InkWell titlecontainer(String title, int? id) {
    final data = Provider.of<ProductProvider>(context);
    return InkWell(
      onTap: () async {
        await Provider.of<ProductProvider>(context, listen: false)
            .fetchSubCategories(id: id!, name: title);
        Provider.of<ProductProvider>(context, listen: false).fetchProducts();
      },
      child: Container(
        height: 20,
        //width: 80,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: data.catname == title ? primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1)),
        child: Center(child: Text(title,style: TextStyle(
          color: data.catname == title ? Colors.white : Colors.black,fontWeight: FontWeight.w500,fontSize: 12))),
      ),
    );
  }
}
