import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:paladins_world/models/champion.dart';
import '../../global/variables.dart';
import '../../service/api_paladins_hirez.dart';
import '../../translation/translations.dart';
import '../widgets/avatar_champion.dart';
import '../widgets/btn_category_champion_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List champions = [];
  List displayChampions = [];

  bool btnSupSelected = false;
  bool btnTankSelected = false;
  bool btnFlankSelected = false;
  bool btnDmgSelected = false;
  bool btnAll = true;
  @override
  void initState() {
    _getChampions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return I18n(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.teal,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(
            appTitle.i18n,
            style: TextStyle(
              color: GlobalsVariables.purpleTitles,
              fontFamily: 'Montserrat',
              fontSize: 22,
            ),
          ),
          centerTitle: true,
          backgroundColor: GlobalsVariables.backgroundColorLight,
        ),
        body: Column(
          children: [
            Container(
              color: Colors.transparent,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 40,
                          width: 80,
                          child: TextButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(10.0),
                              backgroundColor: btnAll
                                  ? MaterialStateProperty.all<Color>(
                                      GlobalsVariables.buttonBlueDark
                                          .withOpacity(0.6))
                                  : MaterialStateProperty.all<Color>(
                                      GlobalsVariables.buttonBlueDark),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                GlobalsVariables.textButtonGrey,
                              ),
                              alignment: Alignment.center,
                            ),
                            onPressed: () => _getChampionsByFilterClass(0),
                            child: Text(
                              'All',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: GlobalsVariables.textButtonGrey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BtnCategoryChampion(
                          selected: btnSupSelected,
                          onPressed: () => _getChampionsByFilterClass(1),
                          pathIcon: 'assets/icons/Support.png',
                          label: 'Support',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        BtnCategoryChampion(
                          selected: btnTankSelected,
                          onPressed: () => _getChampionsByFilterClass(2),
                          pathIcon: 'assets/icons/Front_Line.png',
                          label: 'Tanker',
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BtnCategoryChampion(
                          selected: btnFlankSelected,
                          onPressed: () => _getChampionsByFilterClass(3),
                          pathIcon: 'assets/icons/Flank.png',
                          label: 'Flank',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        BtnCategoryChampion(
                          selected: btnDmgSelected,
                          onPressed: () => _getChampionsByFilterClass(4),
                          pathIcon: 'assets/icons/Damage.png',
                          label: 'Damage',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: GridView.count(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 3 / 2.5,
                crossAxisCount: 2,
                children: List.generate(
                  displayChampions.length,
                  (index) {
                    return AvatarChampion(
                      champion: Champion.fromJson(
                        displayChampions[index],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _getChampionsByFilterClass(int championCategory) {
    //0 all
    //1 sup
    //2 tank
    //3 flank
    //4 damage

    setState(() {
      switch (championCategory) {
        case 0:
          displayChampions.clear();
          for (var item in champions) {
            displayChampions.add(item);
          }
          btnSupSelected = false;
          btnTankSelected = false;
          btnFlankSelected = false;
          btnDmgSelected = false;
          btnAll = true;
          break;
        case 1:
          displayChampions.clear();
          for (var item in champions) {
            if (item["Roles"].contains("Suporte")) {
              displayChampions.add(item);
            }
          }

          btnSupSelected = true;
          btnTankSelected = false;
          btnFlankSelected = false;
          btnDmgSelected = false;
          btnAll = false;
          break;
        case 2:
          displayChampions.clear();
          for (var item in champions) {
            if (item["Roles"].contains("Tanque")) {
              displayChampions.add(item);
            }
          }
          btnTankSelected = true;
          btnSupSelected = false;
          btnFlankSelected = false;
          btnDmgSelected = false;
          btnAll = false;
          break;
        case 3:
          displayChampions.clear();
          for (var item in champions) {
            if (item["Roles"].contains("Flanco")) {
              displayChampions.add(item);
            }
          }
          btnFlankSelected = true;
          btnSupSelected = false;
          btnTankSelected = false;
          btnDmgSelected = false;
          btnAll = false;
          break;
        case 4:
          displayChampions.clear();
          for (var item in champions) {
            if (item["Roles"].contains("Dano")) {
              displayChampions.add(item);
            }
          }
          btnDmgSelected = true;
          btnSupSelected = false;
          btnTankSelected = false;
          btnFlankSelected = false;
          btnAll = false;
          break;
        default:
          displayChampions.clear();
          for (var item in champions) {
            displayChampions.add(item);
          }
          btnSupSelected = false;
          btnTankSelected = false;
          btnFlankSelected = false;
          btnDmgSelected = false;
          btnAll = true;
      }
    });
  }

  _getChampions() async {
    var responseChampions = await ApiPaladinsHirez.getChampions(
        sessionId: GlobalsVariables.sessionId);

    for (var item in responseChampions!) {
      champions.add(item);
      displayChampions.add(item);
    }
    setState(() {});
  }
}
