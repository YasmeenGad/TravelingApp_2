import 'package:flutter/material.dart';
import 'package:travels/trip.dart';
import 'package:travels/trip_item.dart';

import 'app_data.dart';

class CategoryTripScreen extends StatelessWidget {
  final categoryid;
  final categorytitle;

  const CategoryTripScreen(
      @required this.categoryid, @required this.categorytitle);

  @override
  Widget build(BuildContext context) {
    final filtertrip = Trips_data.where((element) {
      return element.categories.contains(categoryid);
    }).toList();
    return Scaffold(
      appBar: AppBar(title: Text(categorytitle)),
      body: ListView.builder(
          itemCount: filtertrip.length,
          itemBuilder: (context, index) {
            return TripItem(
                id: filtertrip[index].id,
                title: filtertrip[index].title,
                imageUrl: filtertrip[index].imageUrl,
                triptype: filtertrip[index].triptype,
                season: filtertrip[index].season,
                duration: filtertrip[index].duration);
          }),
    );
  }
}
