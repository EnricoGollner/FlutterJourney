import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/data/models/cart.dart';
import 'package:shop/data/models/order.dart';

class OrderList with ChangeNotifier {
  final List<Order> _items = [];

  List<Order> get items => [..._items];

  int get itemsCount => _items.length;

  void addOrder(Cart newCart) {
    _items.insert(
      0,
      Order(
        id: Random().nextDouble().toString(),
        total: newCart.totalAmount,
        products: newCart.items.values.toList(),
        date: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
