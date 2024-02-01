import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/data/models/product.dart';
import 'package:shop/data/models/product_list.dart';
import 'package:shop/pages/components/product_grid_item_card.dart';

class ProductGrid extends StatelessWidget {
  final bool favoriteOnly;

  const ProductGrid({super.key, required this.favoriteOnly});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<Product> loadedProducts = favoriteOnly ? provider.favoriteItems : provider.items;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: GridView.builder(
        itemCount: loadedProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: loadedProducts[index],
          child: const ProductGridItemCard(),
        ),
      ),
    );
  }
}
