import 'package:flutter/material.dart';

class ReminderTile extends StatefulWidget {
  const ReminderTile({super.key});

  @override
  State<ReminderTile> createState() => _ReminderTileState();
}

class _ReminderTileState extends State<ReminderTile> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8.0),
      children: [
        ListTile(
          leading: Icon(Icons.fitness_center),
          title: Text('New Workout Is Available'),
          subtitle: Text('June 10 - 10:00 AM'),
        ),
        ListTile(
          leading: Icon(Icons.local_drink),
          title: Text('Don\'t Forget To Drink Water'),
          subtitle: Text('June 10 - 8:00 AM'),
        ),
        ListTile(
          leading: Icon(Icons.check_circle),
          title: Text('Upper Body Workout Completed!'),
          subtitle: Text('June 9 - 6:00 PM'),
        ),
        ListTile(
          leading: Icon(Icons.timer),
          title: Text('Remember Your Exercise Session'),
          subtitle: Text('June 9 - 3:00 PM'),
        ),
        ListTile(
          leading: Icon(Icons.article),
          title: Text('New Article & Tip Posted!'),
          subtitle: Text('June 9 - 10:00 AM'),
        ),
        ListTile(
          leading: Icon(Icons.radar_outlined),
          title: Text('You Started A New Challenge!'),
          subtitle: Text('May 29 - 8:00 AM'),
        ),
        ListTile(
          leading: Icon(Icons.home_work),
          title: Text('New House Training Ideas!'),
          subtitle: Text('May 29 - 8:00 AM'),
        ),
      ],
    );;
  }
}
