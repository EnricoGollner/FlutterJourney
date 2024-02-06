import 'package:flutter/material.dart';
import 'package:shop/core/utils/app_routes.dart';
import 'package:shop/data/models/product_list.dart';
import 'package:shop/pages/components/app_drawer.dart';
import 'package:shop/pages/products_management/components/product_item_card.dart';

class ProductsManagementPage extends StatelessWidget {
  const ProductsManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductList productListProvider = ProductList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Products'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.PRODUCTS_ADD),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(color: Colors.grey, thickness: 1),
          itemCount: productListProvider.items.length,
          itemBuilder: (context, index) {
            final product = productListProvider.items[index];
            return ProductItemCard(imageUrl: product.urlImage, title: product.title);
          },
        ),
      ),
    );
  }
}
