import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zakysoftproject/providers/product_providers.dart';
import 'package:zakysoftproject/screens/product_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
      
          primarySwatch: Colors.blue,
        ),
        home: ProdectScreen(),
      ),
    );
  }
}


