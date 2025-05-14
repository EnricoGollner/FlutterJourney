import 'package:ninja_trips_animation_app/models/trip.dart';
import 'package:ninja_trips_animation_app/screens/details.dart';
import 'package:flutter/material.dart';

class TripList extends StatefulWidget {
  const TripList({super.key});

  @override
  TripListState createState() => TripListState();
}

class TripListState extends State<TripList> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<Widget> _tripTiles = [];
  late Tween<Offset> _offset;

  @override
  void initState() {
    super.initState();
    _offset = Tween(begin: Offset(1, 0), end: Offset.zero);
    WidgetsBinding.instance.addPostFrameCallback((_) async => await _addTrips());
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      initialItemCount: _tripTiles.length,
      itemBuilder: (context, index, animation) {
        return SlideTransition(
          position: animation.drive(_offset),
          child: _tripTiles[index],
        );
      },
    );
  }

  Future<void> _addTrips() async {
    List<Trip> trips = [
      Trip(title: 'Beach Paradise', price: '350', nights: '3', img: 'beach.png'),
      Trip(title: 'City Break', price: '400', nights: '5', img: 'city.png'),
      Trip(title: 'Ski Adventure', price: '750', nights: '2', img: 'ski.png'),
      Trip(title: 'Space Blast', price: '600', nights: '4', img: 'space.png'),
    ];

    Future ft = Future((){});
    for (Trip trip in trips) {
      ft = ft.then((_) {
        return Future.delayed(Duration(milliseconds: 100), () {
          _tripTiles.add(_buildTile(trip));
          //Updating the state of the global key to say that we added a new item
          //and that way, flutter can keep track of the items added to the list and animate them
          _listKey.currentState?.insertItem(_tripTiles.length - 1); // Adding the indexes 
        },);
      });
    }
  }

  Widget _buildTile(Trip trip) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Details(trip: trip)));
      },
      contentPadding: EdgeInsets.all(25),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Hero(
          tag: trip.img,
          child: Image.asset(
            'images/${trip.img}',
            height: 50.0,
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('${trip.nights} nights',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue[300])),
          Text(trip.title, style: TextStyle(fontSize: 20, color: Colors.grey[600])),
        ],
      ),
      trailing: Text('\$${trip.price}'),
    );
  }
}
