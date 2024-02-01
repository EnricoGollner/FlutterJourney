import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/core/utils/app_routes.dart';
import 'package:shop/data/enums/filter_options.dart';
import 'package:shop/data/models/cart.dart';
import 'package:shop/pages/components/app_drawer.dart';
import 'package:shop/pages/components/product_grid.dart';

class ProductsOverviewPage extends StatefulWidget {
  const ProductsOverviewPage({super.key});

  @override
  State<ProductsOverviewPage> createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Store'),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            onSelected: (FilterOptions selectedValue) {
              setState(() => _showFavoriteOnly = selectedValue == FilterOptions.favorite);
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: FilterOptions.favorite,
                child: Text('Only Favorites'),
              ),
              const PopupMenuItem(
                value: FilterOptions.all,
                child: Text('All'),
              ),
            ],
          ),
          Consumer<Cart>(
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.CART);
              },
              icon: const Icon(
                Icons.shopping_cart,
              ),
            ),
            builder: (_, cart, child) => Badge(
              offset: const Offset(-5, 4),
              label: Text('${cart.itemsCount}'),
              child: child,
            ),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: ProductGrid(favoriteOnly: _showFavoriteOnly),
    );
  }
}
