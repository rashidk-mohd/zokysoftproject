import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:zakysoftproject/providers/product_providers.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    final data2=Provider.of<ProductProvider>(context);
    return Consumer<ProductProvider>(
      builder: (context, value, child) =>  ListView.builder(itemBuilder:  (context, index) => Card(
           child: ListTile(
             leading: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1)
              ),
              height: 400,
              width: 100,
              child: Text(value.category[index].name_arabic.toString())
             ),
             trailing: Column(
               children: [
                Text(value.category[index].id.toString()),
               ]
             )
           ),
         ),),
    );
  }
}