import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../models/champion.dart';
import '../pages/champion_details_page.dart';

class AvatarChampion extends StatelessWidget {
  final Champion champion;

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
                color: Color.fromARGB(255, 242, 247, 244),
                blurRadius: 10.0,
                spreadRadius: 1.0,
              ), //BoxShadow
              //BoxShadow
            ],
          ),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChampionDetailsPage(champion: champion),
                ),
              );
              // Navigator.pushNamed(context, '/championDetails', arguments: champion);
            },
            child: CachedNetworkImage(
              fadeOutDuration: const Duration(milliseconds: 500),
              imageUrl: champion.championIconURL,
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
            champion.name,
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
