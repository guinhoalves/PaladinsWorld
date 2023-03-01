import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AvatarChampion extends StatelessWidget {
  final dynamic champion;

  const AvatarChampion({
    super.key,
    required this.champion,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 110,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.teal, width: 2.0),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 161, 229, 196),
                offset: Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow
              BoxShadow(
                color: Color.fromARGB(255, 71, 239, 239),
                offset: Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
          ),
          child: InkWell(
            onTap: () {
              print(champion);
            },
            child: CachedNetworkImage(
              fadeOutDuration: const Duration(milliseconds: 500),
              imageUrl: champion["ChampionIcon_URL"],
              imageBuilder: (context, imageProvider) => Container(
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    //colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn),
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
          ),
        ),
        Expanded(
          child: Text(
            champion["Name"],
            style: const TextStyle(
              color: Colors.amber,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
