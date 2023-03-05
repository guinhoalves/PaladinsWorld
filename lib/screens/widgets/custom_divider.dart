import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 40,
      thickness: 3,
      indent: 30,
      endIndent: 30,
      color: Colors.teal[300],
    );
  }
}
