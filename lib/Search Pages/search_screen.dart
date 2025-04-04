import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pose_detection_realtime/Search%20Pages/workout_search.dart';

import 'all_search.dart';
import 'nutrition_search.dart';



class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _selectedTab = 0;
  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: IconButton(
          icon:  Icon(
            Icons.navigate_before,
            color: Theme.of(context).colorScheme.onPrimary,
            size: 40,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Search',
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Theme.of(context).colorScheme.primary,),
        ),
      ),
      body: Column(
        children: [
          _buildSearchField(),
          _buildTabButtons(),
          Expanded(
            child: _buildTabContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTabButton("All", 0),
        _buildTabButton("Workout", 1),
        _buildTabButton("Nutrition", 2),
      ],
    );
  }
  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0,right: 16,bottom: 16,),
      child: TextField(
        onChanged: (value) {
          setState(() {
            _searchQuery = value.toLowerCase(); // Convert to lowercase for better matching
          });
        },
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Colors.white
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 12),
          filled: true,
          fillColor: Colors.white,
          hintText: "Search...",
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Colors.black
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Color(0xff295095)),
          ),
        ),
      ),
    );
  }

  Widget _buildTabButton(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        decoration: BoxDecoration(
          color: _selectedTab == index ? Theme.of(context).colorScheme.onPrimary : Colors.white,
          borderRadius: BorderRadius.circular(38),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: _selectedTab == index ? Colors.black :Theme.of(context).colorScheme.primary ,
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    if (_selectedTab == 0) {
      return AllSearch();
    } else if (_selectedTab == 1) {
      return WorkoutSearch();
    } else {
      return NutritionSearch();
    }
  }
}
