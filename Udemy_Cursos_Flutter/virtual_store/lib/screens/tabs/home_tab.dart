import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBodyBackground(),
        CustomScrollView(
          slivers: [
            const SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('News'),
                centerTitle: true,
              ),
            ),
            FutureBuilder<QuerySnapshot>(
                future: FirebaseFirestore.instance
                    .collection("home")
                    .orderBy("pos")
                    .get(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return SliverToBoxAdapter(
                      child: Container(
                        height: 200,
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    );
                  } else {
                    print(snapshot.data!.docs.length);
                    return SliverToBoxAdapter(child: Container(),);
                  }
                })
          ],
        )
      ],
    );
  }

  Widget _buildBodyBackground() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 211, 118, 130),
          Color.fromARGB(255, 253, 101, 168),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
    );
  }
}
