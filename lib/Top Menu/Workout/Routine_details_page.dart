import 'package:flutter/material.dart';

class RoutineDetailsPage extends StatelessWidget {
  final String title;

  RoutineDetailsPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Header
          Image.asset('assets/images/squats.jpg', height: 200, fit: BoxFit.cover),
          SizedBox(height: 16),
          Text(
            '45 Minutes - 350 Kcal - 5 Exercises',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          // Rounds and exercises
          _buildRoundCard('Round 1', [
            'Exercise 1 - Reps 2x',
            'Exercise 2 - Reps 3x',
          ]),
          _buildRoundCard('Round 2', [
            'Exercise 3 - Reps 2x',
            'Exercise 4 - Reps 3x',
          ]),
        ],
      ),
    );
  }

  Widget _buildRoundCard(String roundTitle, List<String> exercises) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(roundTitle, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            ...exercises.map((exercise) => Text(exercise, style: TextStyle(fontSize: 16))).toList(),
          ],
        ),
      ),
    );
  }
}
