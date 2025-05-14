import 'package:ninja_trips_animation_app/models/trip.dart';
import 'package:flutter/material.dart';
import 'package:ninja_trips_animation_app/shared/heart.dart';

class Details extends StatelessWidget {
  final Trip trip;
  const Details({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            child: Hero(
              tag: trip.img,
              child: Image.asset(
                'images/${trip.img}',
                height: 360,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            )
          ),
          SizedBox(height: 30),
          ListTile(
            title: Text(
              trip.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey[800]
              )
            ),
            subtitle: Text(
              '${trip.nights} night stay for only \$${trip.price}',
              style: TextStyle(letterSpacing: 1)
            ),
            trailing: Heart()
          ),
          Padding(
            padding: EdgeInsets.all(18),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi sit amet orci ut elit faucibus hendrerit id quis risus. Nam bibendum posuere purus ac finibus. Sed odio nibh, eleifend efficitur urna eu, egestas efficitur orci. Phasellus erat lectus, volutpat quis sapien quis, porta semper nisl. Quisque ac dictum tortor. Aliquam viverra commodo ultricies. Sed laoreet ligula quis ipsum tincidunt, eu pellentesque diam tincidunt.',
              style: TextStyle(
                color: Colors.grey[600],
                height: 1.4
              )
            )
          ),
        ],
      )
    );
  }
}