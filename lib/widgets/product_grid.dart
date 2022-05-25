import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/product_provider.dart';
import 'package:shopping_app/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final productLength = productProvider.recordsFiltered;
    final productData = productProvider.products;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: productLength,
      itemBuilder: (ctx, i) {
        return ProductItem(
            productData.data[i].productId.toString(),
            productData.data[i].productNameEnglish,
            productData.data[i].imageUrl);
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
