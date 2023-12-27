import 'package:flutter/material.dart';

class CustomDrawerItem extends StatelessWidget {
  final String route;
  final String label;
  final IconData icon;

  const CustomDrawerItem({super.key, required this.route, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, route);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child:  Row(
                children: [
                  Icon(icon),
                  const SizedBox(width: 5),
                  Text(label),
                ],
              ),
            ),
          );
  }
}