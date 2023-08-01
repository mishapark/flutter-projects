import 'package:flutter/material.dart';

class MapIconButton extends StatelessWidget {
  final Icon icon;
  final double iconSize;
  final VoidCallback onTap;

  const MapIconButton(
      {super.key,
      required this.icon,
      required this.onTap,
      required this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10)),
      width: 40,
      height: 40,
      child: IconButton(
        color: Colors.blue,
        iconSize: iconSize,
        padding: EdgeInsets.zero,
        icon: icon,
        onPressed: onTap,
      ),
    );
  }
}
