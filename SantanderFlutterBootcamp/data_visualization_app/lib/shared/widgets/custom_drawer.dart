import 'package:data_visualization_app/shared/routes.dart';
import 'package:data_visualization_app/shared/widgets/custom_drawer_item.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.green),
            currentAccountPicture: Hero(
              tag: 'heroImage',
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/dog.jpg'),
              ),
            ),
            accountName: Text('Enrico'),
            accountEmail: Text('enricogollner.tech@gmail.com'),
          ),
         CustomDrawerItem(route: homePage, label: 'Home', icon: Icons.home),
         CustomDrawerItem(route: registerPage, label: 'Register', icon: Icons.app_registration_outlined),
        ],
      ),
    );
  }
}
