import 'package:flutter/material.dart';

class PageViewPage extends StatefulWidget {
  const PageViewPage({super.key});

  @override
  State<PageViewPage> createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  final _pageController = PageController(initialPage: 1);

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PageView Widget"),
        actions: [
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () => _pageController.previousPage(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_right),
            onPressed: () => _pageController.nextPage(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            ),
          ),
        ],
      ),
      body: PageView(
        // physics: const NeverScrollableScrollPhysics(),  // Disallow scrolls
        controller: _pageController,
        scrollDirection: Axis.vertical,
        onPageChanged: (index) {
          print("Page ${index + 1}");
        },
        children: [
          Container(
            color: Colors.red,
            child: const Center(
              child: Text(
                "Page 1",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            child: const Center(
              child: Text(
                "Page 2",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Container(
            color: Colors.yellow,
            child: const Center(
              child: Text(
                "Page 3",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
