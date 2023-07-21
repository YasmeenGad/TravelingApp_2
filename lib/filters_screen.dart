import 'package:flutter/material.dart';
import 'package:travels/app_data.dart';
import 'package:travels/app_drawer.dart';
import 'package:travels/main.dart';
import 'package:travels/trip.dart';

var _isInSummer = false;
var _isInWinter = false;
var _isForFamily = false;

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  Map<String, bool> filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };
  List<Trip> avalibleTrip = Trips_data;
  @override
  Widget build(BuildContext context) {
    Widget buildSwitchListTile(title, subtitle, currentvalue, func) {
      return SwitchListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          value: currentvalue,
          onChanged: func);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Trip filter",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  void changefilter(Map<String, bool> filterData) {
                    setState(() {
                      filters = filterData;
                      avalibleTrip = Trips_data.where((element) {
                        if (filters['summer'] == true &&
                            element.isInSummer != true) {
                          return false;
                        }
                        if (filters['winter'] == true &&
                            element.isInWinter != true) {
                          return false;
                        }
                        if (filters['family'] == true &&
                            element.isForFamilies != true) {
                          return false;
                        }
                        return true;
                      }).toList();
                    });
                  }
                });
              },
              icon: Icon(Icons.save))
        ],
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              SizedBox(
                height: 25,
              ),
              buildSwitchListTile(
                  "Summer trips", "Showing summer trips", _isInSummer,
                  (newvalue) {
                setState(() {
                  _isInSummer = newvalue;
                });
              }),
              buildSwitchListTile(
                  "Winter trips", "Showing winter trips", _isInWinter,
                  (newvalue) {
                setState(() {
                  _isInWinter = newvalue;
                });
              }),
              buildSwitchListTile(
                  "Family trip", "Showing family trip", _isForFamily,
                  (newvalue) {
                setState(() {
                  _isForFamily = newvalue;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
