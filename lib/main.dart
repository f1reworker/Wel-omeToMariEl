import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:welcome_to_mari_el/custom_icons.dart';
import 'package:welcome_to_mari_el/data.dart';
import 'package:welcome_to_mari_el/favoritePage/favorite.dart';
import 'package:welcome_to_mari_el/mainPage/Map.dart';
import 'package:welcome_to_mari_el/searchPage/placePage.dart';
import 'package:welcome_to_mari_el/searchPage/searchBar.dart';

import 'placeList.dart';

const PrimaryColor = Color(0xFFFFFEFC);
const MyRed = Color(0xFFFF6860);
String mP;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FilteredPlace>(create: (_) => FilteredPlace()),
        ChangeNotifierProvider<FavoritePlace>(create: (_) => FavoritePlace()),
        ChangeNotifierProvider<DistrictsFil>(create: (_) => DistrictsFil()),
      ],
      child: MaterialApp(
        title: 'Mari El Travel book',
        theme: new ThemeData(
          scaffoldBackgroundColor: const Color(0xFFFFFEFC),
          primaryColor: MyRed,
          fontFamily: "Roboto",
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/search': (context) => SearchList(),
          '/favorite': (context) => FavoritePage(),
          '/place': (context) => PlacePage(),
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
    FavoritePageState().initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Map(),
            FavoritePage(),
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
          ],
        ),
        backgroundColor: MyRed,
      ),
    );
  }
}
