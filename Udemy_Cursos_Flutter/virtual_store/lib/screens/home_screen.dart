import 'package:flutter/material.dart';
import 'package:virtual_store/screens/tabs/home_tab.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        HomeTab(),
      ],
    );
  }
}
