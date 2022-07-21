
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:zakysoftproject/providers/product_providers.dart';

class AllCategory extends StatefulWidget {
  const AllCategory({Key? key}) : super(key: key);

  @override
  State<AllCategory> createState() => _AllCategoryState();
  
}

class _AllCategoryState extends State<AllCategory> {
  @override
  void initState() {
  getAll();
    super.initState();
  }
  Future<void>getAll()async{
    await Provider.of<ProductProvider>(context).fetchProducts();
  }
  @override
  Widget build(BuildContext context) {
    final data=Provider.of<ProductProvider>(context);
    return Consumer<ProductProvider>(builder: (context, value, child) {
      return ListView.builder(itemBuilder: (context, index) => Card(
         child: ListTile(
           leading: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1)
            ),
            height: 400,
            width: 100,
            child: Text(data.category[index].name_arabic.toString())
           ),
           trailing: Column(
             children: [
              Text(data.category[index].id.toString()),
              Text(data.category[index].IS_available_in_app.toString())],
           ),
         ),
       ),
      );
    }
    ,);
  }
}