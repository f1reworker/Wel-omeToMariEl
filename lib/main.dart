import 'package:flutter/material.dart';
import 'package:welcome_to_mari_el/favorite.dart';
import 'package:welcome_to_mari_el/navigation.dart';
import 'package:welcome_to_mari_el/searchBar.dart';
import 'package:welcome_to_mari_el/settings.dart';
import 'package:welcome_to_mari_el/custom_icons.dart';

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
            SearchButton(),
            Flexible(child: Map()),
            Buttons(),
          ],
        ),
      ),
    );
  }
}

class SearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: PrimaryColor,
      ),
      child: RaisedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/search');
        },
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(40.0)),
        child: Row(children: [
          Icon(Icons.search),
          Text("      Поиск..."),
        ]),
      ),
    );
  }
}

class Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.amber[50],
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          new Image.asset(
            'assets/images/map.png',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: PrimaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration: BoxDecoration(
              color: PrimaryColor,
            ),
            height: 70,
            width: 70,
            child: FloatingActionButton(
              heroTag: null,
              child: Icon(
                CustomIcons.cog,
                size: 50,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              backgroundColor: MyRed,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: PrimaryColor,
            ),
            height: 70,
            width: 70,
            child: FloatingActionButton(
              heroTag: null,
              child: Icon(CustomIcons.route, size: 40),
              onPressed: () {
                Navigator.pushNamed(context, '/route');
              },
              backgroundColor: MyRed,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: PrimaryColor,
            ),
            height: 70,
            width: 70,
            child: FloatingActionButton(
              heroTag: null,
              child: Icon(CustomIcons.star_empty, size: 55),
              onPressed: () {
                Navigator.pushNamed(context, '/favorite');
              },
              backgroundColor: MyRed,
            ),
          ),
        ],
      ),
    );
  }
}
