import 'package:flutter/material.dart';
import 'package:travels/app_data.dart';
import 'package:travels/trip.dart';
import 'package:travels/trip_detail_screen.dart';

class FavoritsScreen extends StatefulWidget {
  const FavoritsScreen({super.key});

  @override
  State<FavoritsScreen> createState() => _FavoritsScreenState();
}

class _FavoritsScreenState extends State<FavoritsScreen> {
  List<Trip> favoritTrip = [];
  void managetrip(tripId) {
    final exitindex = favoritTrip.indexWhere((trip) => trip.id == tripId);
    if (exitindex >= 0) {
      setState(() {
        favoritTrip.removeAt(exitindex);
      });
    } else {
      setState(() {
        favoritTrip.add(Trips_data.firstWhere((trip) => trip.id == tripId));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
