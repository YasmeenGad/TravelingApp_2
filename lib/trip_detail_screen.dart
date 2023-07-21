import 'package:flutter/material.dart';
import 'package:travels/trip.dart';
import 'package:travels/trip_item.dart';

import 'app_data.dart';

class TripDetailScreen extends StatefulWidget {
  final id;
  final vaforittrip;

  const TripDetailScreen({required this.id, @required this.vaforittrip});

  @override
  State<TripDetailScreen> createState() => _TripDetailScreenState();
}

class _TripDetailScreenState extends State<TripDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Widget buildSectionText(titleText) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        alignment: Alignment.topLeft,
        child: Text(
          titleText,
          style: TextStyle(
              fontSize: 23, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      );
    }

    List<Trip> favoritTrip = [];

    Widget buildListViewContainer(Widget child) {
      return Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.symmetric(horizontal: 15),
          height: 200,
          child: child);
    }

    final selectedtrip =
        Trips_data.firstWhere((element) => element.id == widget.id);
    return Scaffold(
        appBar: AppBar(
          title: Text("${selectedtrip.title}"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              void managetrip(tripId) {
                final exitindex =
                    favoritTrip.indexWhere((trip) => trip.id == tripId);
                if (exitindex >= 0) {
                  setState(() {
                    favoritTrip.removeAt(exitindex);
                  });
                } else {
                  setState(() {
                    favoritTrip.add(
                        Trips_data.firstWhere((trip) => trip.id == tripId));
                  });
                }
              }
            });
          },
          child: Icon(Icons.star),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedtrip.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionText("Activities"),
              buildListViewContainer(
                ListView.builder(
                    itemCount: selectedtrip.activities.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 0.3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Text(selectedtrip.activities[index]),
                        ),
                      );
                    }),
              ),
              buildSectionText("daily programme"),
              buildListViewContainer(ListView.builder(
                  itemCount: selectedtrip.program.length,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text("${index + 1} day"),
                          ),
                          title: Text(selectedtrip.program[index]),
                        ),
                        Divider(),
                      ],
                    );
                  }))),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ));
  }
}
