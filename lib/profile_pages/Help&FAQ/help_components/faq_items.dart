import 'package:flutter/material.dart';

class FaqItems extends StatefulWidget {
  const FaqItems({super.key, required this.question, required this.index});
  final String question;
  final int index;

  @override
  State<FaqItems> createState() => _FaqItemsState();
}

class _FaqItemsState extends State<FaqItems> {
  List<bool> isExpandedList = List.generate(5, (index) => false);
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      elevation: 0,
      expandedHeaderPadding: EdgeInsets.zero,
      animationDuration: Duration(milliseconds: 300),
      dividerColor: Colors.grey,
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return ListTile(
              title: Text(
                widget.question,
                style: TextStyle(color: Colors.white),
              ),
            );
          },
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem.",
              style: TextStyle(color: Colors.white70),
            ),
          ),
          isExpanded: isExpandedList[widget.index],
        ),
      ],
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          isExpandedList[widget.index] = !isExpanded;
        });
      },
    );
  }
}
