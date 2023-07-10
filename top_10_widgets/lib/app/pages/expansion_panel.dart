import 'package:flutter/material.dart';

class ExpansionPanelPage extends StatefulWidget {
  const ExpansionPanelPage({super.key});

  @override
  State<ExpansionPanelPage> createState() => _ExpansionPanelPageState();
}

class _ExpansionPanelPageState extends State<ExpansionPanelPage> {
  static const loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur tal tal tal tal ipsum dolor sit amet, consectetur ipsum dolor sit amet, consectetur";

  final List<ItemModel> items = [
    ItemModel(header: "Panel 1", body: loremIpsum),
    ItemModel(header: "Panel 2", body: loremIpsum)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expansion Panel Widget"),
      ),
      body: ExpansionPanelList.radio(
        children: items
            .map(
              (item) => ExpansionPanelRadio(
                canTapOnHeader: true,
                value: item.header, // has to be unique!
                headerBuilder: (context, isExpanded) => ListTile(
                  title: Text(
                    item.header,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                body: ListTile(
                  title: Text(
                    item.body,
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class ItemModel {
  final String header;
  final String body;

  ItemModel({required this.header, required this.body});
}
