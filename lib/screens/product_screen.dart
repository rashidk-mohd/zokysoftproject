import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zakysoftproject/widgets/product_view.dart';
import 'package:zakysoftproject/widgets/category_titles.dart';

import '../providers/product_providers.dart';
import '../utls/colors.dart';
import '../widgets/subcategory_part.dart';

class ProdectScreen extends StatefulWidget {
  const ProdectScreen({Key? key}) : super(key: key);

  @override
  State<ProdectScreen> createState() => _ProdectScreenState();
}

class _ProdectScreenState extends State<ProdectScreen> {
  bool isLoading = false;
  @override
  void initState() {
    fetch();
    super.initState();
  }

  Future<void> fetch() async {
    setState(() {
      isLoading = true;
    });
    await Provider.of<ProductProvider>(context, listen: false)
        .fetchCategories();
    await Provider.of<ProductProvider>(context, listen: false)
        .fetchSubCategories(
            //name: "VEGETABLE"
            );
    await Provider.of<ProductProvider>(context, listen: false)
        .fetchProducts(name: "All");
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
              color: iconColor,
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
                color: iconColor,
              )
            ]),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  Row(
                    children:const  [
                      Icon(Icons.grid_view_outlined,color: iconColor),
                      Expanded(child: CategoryTitles()),
                    ],
                  ),
                  const SubCategory(),
                  const SizedBox(height: 800, child: CardOverview())
                ],
              ));
  }
}
