
import 'package:flutter/material.dart';

import 'help_components/faq_items.dart';

class HandQScreen extends StatelessWidget {
  const HandQScreen({super.key});

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
        TextField(
          decoration: InputDecoration(
              hintText: "Search",
              filled: true,
              hintStyle: Theme.of(context).textTheme.labelLarge,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(48),
              borderSide: const BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(48),
              borderSide: const BorderSide(color: Color(0xff295095)),
            ),
          ),
          style:Theme.of(context).textTheme.labelLarge,
        ),
        SizedBox(height: 16),
        ...List.generate(5, (index) {
          return FaqItems(question: "Lorem ipsum dolor sit amet?", index: index);
        }),
      ],
    );
  }
}
