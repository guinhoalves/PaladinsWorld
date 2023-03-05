import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  const CustomTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.amber,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
    );
  }
}
