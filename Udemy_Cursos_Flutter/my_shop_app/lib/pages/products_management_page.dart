import 'package:flutter/material.dart';
import 'package:shop/core/utils/app_routes.dart';
import 'package:shop/data/models/product_list.dart';
import 'package:shop/pages/components/app_drawer.dart';

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
            onPressed: () => Navigator.pushNamed(context, AppRoutes.PRODUCTS_ADD_FORM),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(color: Colors.grey, thickness: 1),
        itemCount: productListProvider.items.length,
        itemBuilder: (context, index) {
          final product = productListProvider.items[index];

          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(product.imageUrl),
            ),
            title: Text(product.title),
            trailing: FittedBox(
              fit: BoxFit.fill,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
