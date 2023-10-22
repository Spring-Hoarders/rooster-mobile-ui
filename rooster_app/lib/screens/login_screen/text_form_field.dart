import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFromFields extends StatelessWidget {
  final String hintText;
  const TextFromFields({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
