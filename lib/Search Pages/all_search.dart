import 'package:flutter/material.dart';

import '../components/search_page_card/workout_card.dart';


class AllSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      children: [
        SizedBox(height: 16),
        Column(
          children: [
            WorkoutCard(image: 'assets/images/work2.jpg',
              title: 'Circuit Training',
              time: '50 Minutes',
              exercises: '5 exercises',
              energy: '1300 Kcal',)
          ],
        )
      ],
    );
  }
  List<Widget> _buildAllSearchItems() {
    final items = [
      _buildListItem("Circuit Training", "50 Minutes · 1300 Kcal"),
      _buildListItem("Delights With Greek Yogurt", "6 Minutes · 200 Kcal"),
      _buildListItem("Split Strength Training", "20 Minutes · 1250 Kcal"),
      _buildListItem("Turkey And Avocado Wrap", "8 Minutes · 400 Kcal"),
    ];
    return items;
  }

  Widget _buildListItem(String title, String details) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(details),
      ),
    );
  }
}
