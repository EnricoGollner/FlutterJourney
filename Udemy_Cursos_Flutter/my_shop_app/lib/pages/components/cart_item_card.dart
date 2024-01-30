import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/core/utils/formatters.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/cart_item.dart';

class CartItemCard extends StatelessWidget {
  final CartItem cartItem;

  const CartItemCard({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItem.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 30),
        color: Theme.of(context).colorScheme.error,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      onDismissed: (_) => Provider.of<Cart>(context, listen: false).removeItem(cartItem.productId),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: FittedBox(
                  child: Text('${cartItem.price}'),
                ),
              ),
            ),
            title: Text(cartItem.name),
            subtitle: Text('Total: ${Formatters.doubleToCurrency(cartItem.price * cartItem.quantity)}'),
            trailing: Text('${cartItem.quantity}x'),
          ),
        ),
      ),
    );
  }
}
