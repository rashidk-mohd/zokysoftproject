import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_providers.dart';
import 'package:zakysoftproject/models/subcategory_model.dart';

import '../utls/colors.dart';

class SubCategory extends StatefulWidget {
  const SubCategory({
    Key? key,
  }) : super(key: key);

  @override
  State<SubCategory> createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.filter_alt_rounded,color: iconColor),
        Expanded(
            child: SizedBox(
          height: 20,
          child: Consumer<ProductProvider>(
            builder: (context, value, child) => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: value.subCategory.length,
              itemBuilder: (context, index) {
                final subCat = value.subCategory[index];

                return InkWell(
                  onTap: () {
                    Provider.of<ProductProvider>(context,listen: false).fetchProducts(catId: subCat.id,name: subCat.name!);
                  },
                  child: ItemName(subCat.name),
                );
              },
            ),
          ),
        )),
      ],
    );
  }

  Container ItemName(String? name) {
    final data=Provider.of<ProductProvider>(context);
    return Container(
      height: 20,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: data.subName==name?primaryColor:Colors.white,
          borderRadius: BorderRadius.circular(5), border: Border.all(width: 1)),
      child: Center(child: Text("$name",style: TextStyle(color: data.subName==name?Colors.white:Colors.black,fontWeight: FontWeight.w500,fontSize: 12),)),
    );
  }
}
