import 'package:flutter/material.dart';

import 'contactTab.dart';
import 'h&qScreen.dart';


class HelpFAQPage extends StatefulWidget {
  @override
  _HelpFAQPageState createState() => _HelpFAQPageState();
}

class _HelpFAQPageState extends State<HelpFAQPage> {
  int selectedTab = 0; // 0 for FAQ, 1 for Contact Us
  List<bool> isExpandedList = List.generate(5, (index) => false); // Manage expansion for FAQs

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: IconButton(
          icon: const Icon(
            Icons.navigate_before,
            color: Colors.white,
            size: 40,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Help & FAQs",
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          // Tab Switcher
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                _buildTabButton("FAQ", 0),
                SizedBox(width: 16),
                _buildTabButton("Contact Us", 1),
              ],
            ),
          ),
          // Content Based on Tab
          Expanded(
            child: selectedTab == 0 ? HandQScreen() : Contacttab(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title, int tabIndex) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = tabIndex;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: selectedTab == tabIndex ?  Theme.of(context).colorScheme.onPrimary: Colors.white,
          borderRadius: BorderRadius.circular(38),
        ),
        child: Text(
          title,
          style:Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color:selectedTab == tabIndex ? Colors.black : Theme.of(context).colorScheme.primary,
          )
        ),
      ),
    );
  }
}
