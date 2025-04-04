import 'package:flutter/material.dart';

class ExerciseDetailsPage extends StatelessWidget {
  final String exerciseName;

  ExerciseDetailsPage({required this.exerciseName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exerciseName),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Image.asset('assets/images/squats.jpg', height: 250, fit: BoxFit.cover),
          SizedBox(height: 16),
          Text(
            exerciseName,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text('Instructions for the exercise go here.', style: TextStyle(fontSize: 16)),
          Spacer(),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.play_arrow),
            label: Text('Start Exercise'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            ),
          ),
        ],
      ),
    );
  }
}
