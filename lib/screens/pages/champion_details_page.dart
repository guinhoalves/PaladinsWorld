import 'package:flutter/material.dart';
import '../../models/champion.dart';

class ChampionDetailsPage extends StatefulWidget {
  final Champion champion;
  const ChampionDetailsPage({
    super.key,
    required this.champion,
  });

  @override
  State<ChampionDetailsPage> createState() => _ChampionDetailsPageState();
}

class _ChampionDetailsPageState extends State<ChampionDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.champion.name,
          style: const TextStyle(
            color: Colors.amber,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        //backgroundColor: Colors.teal.shade300,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Colors.teal,
                Colors.blue.shade400,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
