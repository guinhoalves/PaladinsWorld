import 'package:flutter/material.dart';
import 'screens/pages/home_page.dart';
import 'utils/functions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UtilsFunctions.createSession();
  runApp(const PaladinsWorld());
}

class PaladinsWorld extends StatelessWidget {
  const PaladinsWorld({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Paladins World',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(20, 59, 79, 1),
        brightness: Brightness.dark,
        primaryColor: const Color.fromARGB(255, 24, 110, 152),
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
      },
    );
  }
}
