import 'package:flutter/material.dart';

class WorkoutSearch extends StatelessWidget {
  final List<String> searches = ["Circuit", "Split", "Challenge", "Legs", "Cardio"];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      children: searches.map((search) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            leading: Icon(Icons.search, color: Colors.yellow),
            title: Text(search),
          ),
        );
      }).toList(),
    );
  }
}
