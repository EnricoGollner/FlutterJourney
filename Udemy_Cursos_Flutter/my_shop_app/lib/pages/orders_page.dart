import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/pages/components/app_drawer.dart';
import 'package:shop/data/models/order_list.dart';
import 'package:shop/pages/components/order_card.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderList ordersProvider = Provider.of<OrderList>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: ListView.builder(
          itemCount: ordersProvider.itemsCount,
          itemBuilder: (context, index) => OrderCard(order: ordersProvider.items[index]),
        ),
      ),
    );
  }
}
