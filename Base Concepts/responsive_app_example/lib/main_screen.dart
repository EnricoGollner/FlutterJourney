import 'package:flutter/material.dart';
import 'package:responsive_app_example/responsive/body/desktop_body.dart';
import 'package:responsive_app_example/responsive/body/mobile_body.dart';
import 'package:responsive_app_example/responsive/responsive_layout.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ///1 method is with MediaQuery:
    // final double currentWidth = MediaQuery.sizeOf(context).width;

    // return Scaffold(
    //   backgroundColor: currentWidth < 780 ? Colors.deepPurple[300] : Colors.green[300],
    //   body: Center(
    //     child: Text(currentWidth.toString()),
    //   ),
    // );

    ///2 method:
    return const ResponsiveLayout(
      mobileBody: MobileBody(),
      desktopBody: DesktopBody(),
    );
  }
}