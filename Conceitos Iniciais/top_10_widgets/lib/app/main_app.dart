import 'package:flutter/material.dart';
import 'package:top_10_widgets/app/pages/bottom_sheet.dart';
import 'package:top_10_widgets/app/pages/checkbox_page.dart';
import 'package:top_10_widgets/app/pages/dropdown_menu.dart';
import 'package:top_10_widgets/app/pages/expansion_panel.dart';
import 'package:top_10_widgets/app/pages/expansion_tile.dart';
import 'package:top_10_widgets/app/pages/pageview_page.dart';
import 'package:top_10_widgets/app/pages/popup_dialog_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Top 10 Widgets",
      initialRoute: "/expasion-panel-widget-page",
      routes: {
        "/": (context) => const ModalBootomSheet(),
        "/expansion-tile": (context) => const ExpansionTilePage(),
        "/checkbox": (context) => const CheckboxPage(),
        "/popup-dialog": (context) => const PopUpDialogPage(),
        "/dropdown-menu": (context) => const DropdownMenuPage(),
        "/pageview-page": (context) => const PageViewPage(),
        "/expasion-panel-widget-page": (context) => const ExpansionPanelPage(),
      },
    );
  }
}
