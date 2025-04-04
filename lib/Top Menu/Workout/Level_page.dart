import 'package:flutter/material.dart';

import 'Routine_details_page.dart';
class LevelPage extends StatelessWidget {
  final String level;

  LevelPage({required this.level});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(level),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          _buildRoutineCard(context, 'Routine 1', 'Details about Routine 1', 'assets/images/squats.jpg'),
          _buildRoutineCard(context, 'Routine 2', 'Details about Routine 2', 'assets/images/squats.jpg'),
        ],
      ),
    );
  }

  Widget _buildRoutineCard(BuildContext context, String title, String subtitle, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RoutineDetailsPage(title: title),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: ListTile(
          leading: Image.asset(imagePath, width: 50, fit: BoxFit.cover),
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(subtitle),
          trailing: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
