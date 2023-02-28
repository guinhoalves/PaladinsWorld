import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../global/variables.dart';
import '../../service/api_paladins_hirez.dart';
import '../../utils/functions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  List champions = [];
  @override
  void initState() {
    _getChampions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'World Of Paladins',
          style: TextStyle(
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
      body: Column(
        children: [
          // Container(
          //   color: Colors.transparent,
          //   padding: EdgeInsets.only(top: 10, bottom: 10),
          //   child: Center(
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         Row(
          //           children: [
          //             Container(
          //               height: 40,
          //               width: 80,
          //               child: TextButton(
          //                 style: ButtonStyle(
          //                   elevation: MaterialStateProperty.all(10.0),
          //                   backgroundColor: controller.btnAll.value
          //                       ? MaterialStateProperty.all<Color>(Colors.teal.shade500)
          //                       : MaterialStateProperty.all<Color>(Colors.teal.shade300),
          //                   foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          //                   alignment: Alignment.center,
          //                 ),
          //                 onPressed: () => controller.selecionafiltroClass(0),
          //                 child: Text(
          //                   'Todos',
          //                   style: TextStyle(
          //                     fontFamily: 'Montserrat',
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //         Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Container(
          //               height: 40,
          //               width: 120,
          //               child: TextButton.icon(
          //                 style: ButtonStyle(
          //                   elevation: MaterialStateProperty.all(10.0),
          //                   backgroundColor: controller.btnSupSelecionado.value
          //                       ? MaterialStateProperty.all<Color>(Colors.teal.shade500)
          //                       : MaterialStateProperty.all<Color>(Colors.teal.shade300),
          //                   foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          //                   alignment: Alignment.topLeft,
          //                 ),
          //                 onPressed: () => controller.selecionafiltroClass(1),
          //                 icon: Image.asset(
          //                   "assets/icons/Support.png",
          //                   color: Colors.black,
          //                 ),
          //                 label: const Text(
          //                   'Supporte',
          //                   style: TextStyle(
          //                     fontFamily: 'Montserrat',
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             SizedBox(
          //               height: 10,
          //             ),
          //             Container(
          //               height: 40,
          //               width: 120,
          //               child: TextButton.icon(
          //                 style: ButtonStyle(
          //                   elevation: MaterialStateProperty.all(10.0),
          //                   backgroundColor: controller.btntankSelecionado.value
          //                       ? MaterialStateProperty.all<Color>(Colors.teal.shade500)
          //                       : MaterialStateProperty.all<Color>(Colors.teal.shade300),
          //                   foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          //                   alignment: Alignment.topLeft,
          //                 ),
          //                 onPressed: () => controller.selecionafiltroClass(2),
          //                 icon: Image.asset(
          //                   "assets/icons/Front_Line.png",
          //                   color: Colors.black,
          //                 ),
          //                 label: const Text(
          //                   'Tanker',
          //                   style: TextStyle(
          //                     fontFamily: 'Montserrat',
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //         Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Container(
          //               height: 40,
          //               width: 120,
          //               child: TextButton.icon(
          //                 style: ButtonStyle(
          //                   elevation: MaterialStateProperty.all(10.0),
          //                   backgroundColor: controller.btnFlankSelecionado.value
          //                       ? MaterialStateProperty.all<Color>(Colors.teal.shade500)
          //                       : MaterialStateProperty.all<Color>(Colors.teal.shade300),
          //                   foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          //                   alignment: Alignment.topLeft,
          //                 ),
          //                 onPressed: () => controller.selecionafiltroClass(3),
          //                 icon: Image.asset(
          //                   "assets/icons/Flank.png",
          //                   color: Colors.black,
          //                 ),
          //                 label: const Text(
          //                   'Flanco',
          //                   style: TextStyle(
          //                     fontFamily: 'Montserrat',
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             const SizedBox(
          //               height: 10,
          //             ),
          //             Container(
          //               height: 40,
          //               width: 120,
          //               child: TextButton.icon(
          //                 style: ButtonStyle(
          //                   elevation: MaterialStateProperty.all(10.0),
          //                   backgroundColor: controller.btnDmgSelecionado.value
          //                       ? MaterialStateProperty.all<Color>(Colors.teal.shade500)
          //                       : MaterialStateProperty.all<Color>(Colors.teal.shade300),
          //                   foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          //                   alignment: Alignment.topLeft,
          //                 ),
          //                 onPressed: () => controller.selecionafiltroClass(4),
          //                 icon: Image.asset(
          //                   "assets/icons/Damage.png",
          //                   color: Colors.black,
          //                 ),
          //                 label: const Text(
          //                   'Damage',
          //                   style: TextStyle(
          //                     fontFamily: 'Montserrat',
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          // const SizedBox(
          //   height: 5,
          // ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 3 / 2.5,
              crossAxisCount: 2,
              children: List.generate(
                champions.length,
                (index) {
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
                            print(champions[index]);
                          },
                          child: CachedNetworkImage(
                            fadeOutDuration: const Duration(milliseconds: 500),
                            imageUrl: champions[index]["ChampionIcon_URL"],
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
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          champions[index]["Name"],
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
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getChampions() async {
    isLoading = true;
    var responseChampions = await ApiPaladinsHirez.getChampions(sessionId: GlobalsVariables.sessionId);

    for (var item in responseChampions!) {
      champions.add(item);
      // campeoesExibicao.add(item);
    }
    setState(() {
      isLoading = false;
    });
    print(champions);
  }
}
