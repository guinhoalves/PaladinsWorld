import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:paladins_world/models/champion_abilities.dart';

class ContainerAbility extends StatefulWidget {
  final ChampionAbility ability;
  const ContainerAbility({
    super.key,
    required this.ability,
  });

  @override
  State<ContainerAbility> createState() => _ContainerAbilityState();
}

class _ContainerAbilityState extends State<ContainerAbility> {
  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width * 0.8;
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(20, 59, 79, 1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.teal, width: 2.0),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(235, 240, 243, 1),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ), //BoxShadow
          //BoxShadow
        ],
      ),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        alignment: WrapAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Text(
                widget.ability.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Rockwell',
                  fontSize: 20,
                ),
              ),
            ),
          ),
          CachedNetworkImage(
            fadeOutDuration: const Duration(milliseconds: 500),
            imageUrl: widget.ability.urlImage,
            imageBuilder: (context, imageProvider) => Container(
              alignment: Alignment.center,
              height: 110,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(
                color: Colors.teal.shade300,
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: cWidth / 1,
            child: Text(
              widget.ability.description,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Myriad Pro',
                fontSize: 15,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
