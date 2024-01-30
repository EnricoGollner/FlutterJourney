import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/models/cart_item.dart';
import 'package:shop/models/product.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemsCount => _items.length;

  double get totalAmount {
    double totalAmount = 0.0;
    _items.forEach((key, cartItem) {
      totalAmount += (cartItem.price * cartItem.quantity);
    });

    return totalAmount;
  }

  void addItem(Product newProduct) {
    if (_items.containsKey(newProduct.id)) {
      _items.update(
        newProduct.id,
        (existingItem) =>
            existingItem.copyWith(quantity: existingItem.quantity + 1),
      );
    } else {
      _items.putIfAbsent(
        newProduct.id,
        () => CartItem(
          id: Random().nextDouble().toString(),
          productId: newProduct.id,
          name: newProduct.title,
          quantity: 1,
          price: newProduct.price,
        ),
      );
    }

    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
