import 'package:flutter/material.dart';
import 'package:travels/trip.dart';
import 'package:travels/trip_detail_screen.dart';

class TripItem extends StatelessWidget {
  final id;
  final title;
  final imageUrl;
  final TripType triptype;
  final Season season;
  final duration;
  final removeItem;

  const TripItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.triptype,
    required this.season,
    required this.duration,
    @required this.removeItem,
  });

  String get SeasonText {
    switch (season) {
      case Season.Winter:
        return "Winter";
        break;
      case Season.Spring:
        return "Spring";
        break;
      case Season.Summer:
        return "Summer";
        break;
      case Season.Autumn:
        return "Autumn";
        break;
      default:
        return "Unknown";
    }
  }

  String get TripTYpeText {
    switch (triptype) {
      case TripType.Exploration:
        return "Exploration";
        break;
      case TripType.Recovery:
        return "Recovery";
        break;
      case TripType.Activities:
        return "Activities";
        break;
      case TripType.Therapy:
        return "Therapy";
        break;
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    void selecttrip() {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return TripDetailScreen(
          id: id,
        );
      })).then((value) {
        if (value != null) {
          removeItem(value);
        }
      });
    }

    return InkWell(
      onTap: selecttrip,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: EdgeInsets.all(10),
          elevation: 7,
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0.8)
                        ],
                            stops: [
                          0.6,
                          1
                        ])),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    height: 250,
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.fade,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.today,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text("$duration days"),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.sunny,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text("$SeasonText"),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.family_restroom,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text("$TripTYpeText"),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
