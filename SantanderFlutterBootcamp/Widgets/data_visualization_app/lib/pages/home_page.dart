import 'package:data_visualization_app/data/image_repository.dart';
import 'package:data_visualization_app/shared/routes.dart';
import 'package:data_visualization_app/shared/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String>? imagesPaths = ImageRepository.getImagesPaths();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      drawer: const CustomDrawer(),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Card(
            surfaceTintColor: Colors.transparent,
            elevation: 10,
            shadowColor: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, cardDetailPage,
                              arguments: index);
                        },
                        child: Hero(
                          tag: index,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                                ImageRepository.getImagesPaths()[index]),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text('Hello, Card'),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
