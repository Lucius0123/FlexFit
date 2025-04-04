import 'package:flutter/material.dart';

class SwitchTile extends StatefulWidget {
   SwitchTile({super.key, required this.title, required this.onChanged, required this.value});
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  State<SwitchTile> createState() => _SwitchTileState();
}

class _SwitchTileState extends State<SwitchTile> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      activeTrackColor: Theme.of(context).colorScheme.onPrimary,
      inactiveTrackColor: Theme.of(context).colorScheme.primary,
      title: Text(widget.title, style: Theme.of(context).textTheme.bodyLarge),
      value: widget.value,
      activeColor: Colors.white,
      onChanged:widget.onChanged,
    );
  }
}
