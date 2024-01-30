import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/core/utils/app_routes.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product.dart';

class ProductItemCard extends StatelessWidget {
  const ProductItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Product productProvider = Provider.of<Product>(context, listen: false);
    final Cart cartProvider = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (_, product, __) => IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: () => product.toggleFavorite(),
            ),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () => cartProvider.addItem(productProvider),
          ),
          title: Text(productProvider.title),
        ),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            AppRoutes.PRODUCT_DETAIL,
            arguments: productProvider,
          ),
          child: Image.network(
            productProvider.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
