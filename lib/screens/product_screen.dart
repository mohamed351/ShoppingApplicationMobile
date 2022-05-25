import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/product_provider.dart';
import 'package:shopping_app/widgets/product_grid.dart';

class ProductScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  static const String routerName = "/products";

  const ProductScreen();

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: FutureBuilder(
          future: Provider.of<ProductProvider>(context, listen: false)
              .getProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                  child: Center(
                child: CircularProgressIndicator(),
              ));
            }
            return ProductsGrid();
          }),
    );
  }
}
