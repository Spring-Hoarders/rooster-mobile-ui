import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildingDetails extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const BuildingDetails({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(
              width: 10,
            ),
            Text(text)
          ],
        ),
      ),
    );
  }
}
