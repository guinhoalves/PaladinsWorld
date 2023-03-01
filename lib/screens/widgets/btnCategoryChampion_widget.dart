import 'package:flutter/material.dart';

class BtnCategoryChampion extends StatefulWidget {
  final bool selected;
  final void Function()? onPressed;
  final String pathIcon;
  final String label;
  const BtnCategoryChampion({
    super.key,
    required this.selected,
    required this.onPressed,
    required this.pathIcon,
    required this.label,
  });

  @override
  State<BtnCategoryChampion> createState() => _BtnCategoryChampionState();
}

class _BtnCategoryChampionState extends State<BtnCategoryChampion> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 120,
      child: TextButton.icon(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(10.0),
          backgroundColor: widget.selected
              ? MaterialStateProperty.all<Color>(Colors.teal.shade500)
              : MaterialStateProperty.all<Color>(Colors.teal.shade300),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          alignment: Alignment.topLeft,
        ),
        onPressed: widget.onPressed,
        icon: Image.asset(
          widget.pathIcon,
          color: Colors.black,
        ),
        label: Text(
          widget.label,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
