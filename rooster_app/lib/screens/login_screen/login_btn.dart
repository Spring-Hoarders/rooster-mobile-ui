import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rooster_app/screens/home_screen.dart/home_page.dart';

class LogInButton extends StatelessWidget {
  final String text;

  const LogInButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      },
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(25),
        child: Text(
          textAlign: TextAlign.center,
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
