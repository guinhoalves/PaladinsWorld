import 'package:flutter/material.dart';
import '../../models/champion.dart';
import '../../models/champion_abilities.dart';
import '../widgets/container_ability.dart';
import '../widgets/custom_divider.dart';
import '../widgets/custom_title.dart';
import '../widgets/flexible_title.dart';

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
  List<ChampionAbility> abilities = <ChampionAbility>[];

  @override
  Widget build(BuildContext context) {
    populateListAbilities(champion: widget.champion);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.only(right: 60),
          child: FlexibleTitle(
            champion: widget.champion,
          ),
        ),
        centerTitle: true,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomTitle(title: 'História'),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: Text(
                widget.champion.lore,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Myriad Pro',
                  fontSize: 18,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            const CustomDivider(),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 10,
              ),
              child: const Text(
                'Habilidades',
                style: TextStyle(
                  color: Colors.amber,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: abilities.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ContainerAbility(
                    ability: abilities[index],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  populateListAbilities({required Champion champion}) {
    abilities.clear();
    var ability1 = ChampionAbility(
      id: champion.abilityId1,
      name: champion.ability1,
      description: champion.abilityDescription1,
      urlImage: champion.championAbility1URL,
    );
    abilities.add(ability1);
    var ability2 = ChampionAbility(
      id: champion.abilityId2,
      name: champion.ability2,
      description: champion.abilityDescription2,
      urlImage: champion.championAbility2URL,
    );
    abilities.add(ability2);
    var ability3 = ChampionAbility(
      id: champion.abilityId3,
      name: champion.ability3,
      description: champion.abilityDescription3,
      urlImage: champion.championAbility3URL,
    );
    abilities.add(ability3);
    var ability4 = ChampionAbility(
      id: champion.abilityId4,
      name: champion.ability4,
      description: champion.abilityDescription4,
      urlImage: champion.championAbility4URL,
    );
    abilities.add(ability4);
    var ability5 = ChampionAbility(
      id: champion.abilityId5,
      name: champion.ability5,
      description: champion.abilityDescription5,
      urlImage: champion.championAbility5URL,
    );
    abilities.add(ability5);
  }
}
