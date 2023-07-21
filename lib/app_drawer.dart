import 'package:flutter/material.dart';
import 'package:travels/filters_screen.dart';
import 'package:travels/tabs_screen.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  Widget buildListTile(title, icon, ontab) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: ontab,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 100,
          width: double.infinity,
          padding: EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          color: Colors.amber,
          child: Text(
            "Tourist guide",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        buildListTile("Trips", Icons.card_travel, () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return TabsScreen();
              },
            ),
          );
        }),
        buildListTile("Trip filter", Icons.filter_list, () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return FilterScreen();
              },
            ),
          );
        }),
      ]),
    );
  }
}
