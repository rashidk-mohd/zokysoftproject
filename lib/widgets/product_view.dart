import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:zakysoftproject/providers/product_providers.dart';
import 'package:zakysoftproject/utls/colors.dart';

class CardOverview extends StatefulWidget {
  const CardOverview({Key? key}) : super(key: key);

  @override
  State<CardOverview> createState() => _CardOverviewState();
}

class _CardOverviewState extends State<CardOverview> {
  List pictures = [
    "https://image.shutterstock.com/image-photo/fresh-vegetables-isolated-on-white-600w-232298731.jpg",
    "https://image.shutterstock.com/image-photo/ripe-autumn-vegetables-on-wicker-600w-1798347094.jpg",
  ];
  @override
  var isLoding = false;
  void initState() {
    product();
    super.initState();
  }

  Future<void> product() async {
    setState(() {
      isLoding = true;
    });
    await Provider.of<ProductProvider>(context, listen: false)
        .fetchCategories();
    setState(() {
      isLoding = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ProductProvider>(context);
    return Container(
      child: isLoding
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, i) {
                final imageUrl = (i%2==0) ?pictures[0] : pictures[1];
                return SizedBox(
                height: 120,
                child: Container(
                    child: Card(
                        child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        decoration: BoxDecoration(border: Border.all(width: 1)),
                        height: 400,
                        width: 100,
                        child:Image.network("$imageUrl",fit: BoxFit.fill,)),
                        const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(i.toString()),
                          Text("${data.products[i].name}",style: const TextStyle(
                            fontWeight: FontWeight.bold
                          ),),
                          const SizedBox(height: 20),
                          Text(
                              "${data.products[i].price!.sale_price!.toStringAsFixed(2)} SAR",style: const TextStyle(
                            fontWeight: FontWeight.bold,color: primaryColor
                          ),),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {
                              data.toggleFavorateStatus();
                            },
                            icon: Icon(data.isFavorate
                                ? Icons.favorite
                                : Icons.favorite_border)),
                       data.products[i].is_in_wish_list_count==0 ? Container(
                          height: 20,
                          width: 20,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: primaryColor,
                          ),
                          child:const  Center(child: Icon(Icons.add,color: Colors.white,size: 17,)),
                        ) : Text("data")
                      ],
                    )
                  ],
                ))),
              );
              },
              itemCount: data.products.length,
            ),
    );
  }
}
// ListTile(
//            leading: Container(
//             decoration: BoxDecoration(
//               border: Border.all(width: 1)
//             ),
//             height: 400,
//             width: 100,
//             child: Text("data.category[i].image.toString()")
//            ),
//            trailing: Column(
//              children: [
//               Text(data.products[i].name!),
//               Text(data.products[i].ratings_count.toString())],
//            ),
//          ),