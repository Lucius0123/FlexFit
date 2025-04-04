import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StatusCard extends StatefulWidget {
 StatusCard(  {super.key,required this.title,required this.icon,required this.onTap });
 final String title;
 final String icon;
 VoidCallback onTap;

  @override
  State<StatusCard> createState() => _StatusCardState();
}

class _StatusCardState extends State<StatusCard> {

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        child: IconButton(
          onPressed: widget.onTap,
          icon: SvgPicture.asset(
            widget.icon, // Replace with your SVG file path
            width: 35,
            height: 35,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),),
      ),
      title: Text(
        widget.title,
        style: TextStyle(color: Colors.white),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Theme.of(context).colorScheme.onPrimary),
      onTap: widget.onTap,
    );
  }
}
