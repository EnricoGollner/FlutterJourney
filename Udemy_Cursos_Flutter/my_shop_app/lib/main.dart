import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/core/theme/styles.dart';
import 'package:shop/core/utils/app_routes.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order_list.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/pages/cart_page.dart';
import 'package:shop/pages/orders_page.dart';
import 'package:shop/pages/product_detail_page.dart';
import 'package:shop/pages/products_overview_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductList()),
        ChangeNotifierProvider(create: (context) => Cart()),
        ChangeNotifierProvider(create: (context) => OrderList()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop App',
        theme: Styles.setMaterial3Theme(),
        routes: {
          AppRoutes.HOME: (_) => const ProductsOverviewPage(),
          AppRoutes.PRODUCT_DETAIL: (_) => const ProductDetailPage(),
          AppRoutes.CART: (_) => const CartPage(),
          AppRoutes.ORDERS: (_) => const OrdersPage(),
        },
      ),
    );
  }
}
