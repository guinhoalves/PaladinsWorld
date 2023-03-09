import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'global/variables.dart';
import 'screens/pages/home_page.dart';
import 'utils/functions.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
        scaffoldBackgroundColor: GlobalsVariables.backgroundColorDark,
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
        '/': (context) => I18n(
              child: const HomePage(),
            ),
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', "US"),
        Locale('pt', "BR"),
      ],
    );
  }
}
