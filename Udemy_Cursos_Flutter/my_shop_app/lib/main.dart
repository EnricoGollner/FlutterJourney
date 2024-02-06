import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/core/theme/styles.dart';
import 'package:shop/core/utils/app_routes.dart';
import 'package:shop/data/models/cart.dart';
import 'package:shop/data/models/order_list.dart';
import 'package:shop/data/models/product_list.dart';
import 'package:shop/pages/cart_page.dart';
import 'package:shop/pages/orders_page.dart';
import 'package:shop/pages/product_detail_page.dart';
import 'package:shop/pages/products_management/product_add_page.dart';
import 'package:shop/pages/products_management/products_management_page.dart';
import 'package:shop/pages/products_overview_page.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

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
        scaffoldMessengerKey: scaffoldMessengerKey,
        theme: Styles.setMaterial3Theme(),
        routes: {
          AppRoutes.HOME: (_) => const ProductsOverviewPage(),
          AppRoutes.PRODUCT_DETAIL: (_) => const ProductDetailPage(),
          AppRoutes.CART: (_) => const CartPage(),
          AppRoutes.ORDERS: (_) => const OrdersPage(),
          AppRoutes.PRODUCTS_MANAGEMENT: (_) => const ProductsManagementPage(),
          AppRoutes.PRODUCTS_ADD: (_) => const ProductAddPage(),
        },
      ),
    );
  }
}
