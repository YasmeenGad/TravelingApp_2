import 'package:flutter/material.dart';
import 'package:travels/categories_screen.dart';
import 'package:travels/category_trips_screen.dart';

class CategoryItem extends StatelessWidget {
  final title;
  final imageUrl;
  final id;
  CategoryItem(this.title, this.imageUrl, this.id);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return CategoryTripScreen(id, title);
          },
        ));
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
