import 'package:flutter/material.dart';

import '../../components/profile_components/status_card.dart';

class Contacttab extends StatefulWidget {
  const Contacttab({super.key});

  @override
  State<Contacttab> createState() => _ContacttabState();
}

class _ContacttabState extends State<Contacttab> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Text(
          "How Can We Help You?",
          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        StatusCard(
            title: "Customer Service",
            icon: 'assets/icons/bottom_bar_icons/Support & Help Switch.svg',
            onTap: (){}),
        StatusCard(
            title: "Website",
            icon: 'assets/icons/internet.svg',
            onTap: (){}),
        StatusCard(
            title: "Instagram",
            icon: 'assets/icons/instagram.svg',
            onTap: (){})
      ],
    );
  }
}
