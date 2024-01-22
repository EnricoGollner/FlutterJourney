import 'package:camera_qrcode_app/app/pages/barcode_scanner_page.dart';
import 'package:camera_qrcode_app/app/pages/qr_code_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: _currentPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: _setCurrentPage,
          children: const [
            QRCodePage(),
            BarcodeScannerPage(),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.white,
        color: Colors.blue,
        items: const [
          Icon(Icons.gamepad, size: 30),
          Icon(Icons.home, size: 30),
        ],
        onTap: (index) {
          _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.ease);
        },
      ),
    );
  }

  void _setCurrentPage(int pageIndex) {
    setState(() => _currentPage = pageIndex);
  }
}