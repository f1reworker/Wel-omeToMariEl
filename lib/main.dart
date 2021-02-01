import 'package:flutter/material.dart';
import 'package:welcome_to_mari_el/favoritePage/favorite.dart';
import 'package:welcome_to_mari_el/routePage/navigation.dart';
import 'package:welcome_to_mari_el/searchPage/searchBar.dart';
import 'package:welcome_to_mari_el/settingsPage/settings.dart';
import 'package:welcome_to_mari_el/mainPage/Map.dart';

const PrimaryColor = Color(0xFFFFFEFC);
const MyRed = Color(0xFFFF6860);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mari El Travel book',
      theme: new ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFFEFC),
        //textTheme: GoogleFonts.marmeladTextTheme(
        //  Theme.of(context).textTheme,
        // ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/search': (context) => SearchList(),
        '/favorite': (context) => FavoritePage(),
        '/settings': (context) => SettingsPage(),
        '/route': (context) => NavigationPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(child: Map()),
            Geolocation(),
          ],
        ),
      ),
    );
  }
}
