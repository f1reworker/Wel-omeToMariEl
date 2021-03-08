import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:provider/provider.dart';
import 'package:welcome_to_mari_el/custom_icons.dart';
//import 'package:welcome_to_mari_el/data.dart';
import 'package:welcome_to_mari_el/favoritePage/favorite.dart';
import 'package:welcome_to_mari_el/mainPage/Map.dart';
import 'package:welcome_to_mari_el/routePage/route.dart';
import 'package:welcome_to_mari_el/searchPage/searchBar.dart';
import 'package:welcome_to_mari_el/settingsPage/settings.dart';

const PrimaryColor = Color(0xFFFFFEFC);
const MyRed = Color(0xFFFF6860);
String mP;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mari El Travel book',
      theme: new ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFFEFC),
        primaryColor: MyRed,
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

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Map(),
            FavoritePage(),
            NavigationPage(),
            SettingsPage(),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(
                Icons.map_outlined,
                size: 27,
                color: Colors.white,
              ),
            ),
            Tab(
              icon: Icon(
                CustomIcons.star_empty,
                size: 27,
                color: Colors.white,
              ),
            ),
            Tab(
              icon: Icon(
                CustomIcons.route,
                color: Colors.white,
              ),
            ),
            Tab(
              icon: Icon(
                CustomIcons.cog,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: MyRed,
      ),
    );
  }
}
