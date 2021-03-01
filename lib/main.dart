import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:welcome_to_mari_el/custom_icons.dart';
import 'package:welcome_to_mari_el/mainPage/navigationButton.dart';
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
        accentColor: MyRed,
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
  // int _selectedIndex = 0;
  // void _onItemTap(int index) {
  //   setState(() {
  //     if (_selectedIndex != index) {
  //       _selectedIndex = index;

  //       switch (index) {
  //         case 0:
  //           Navigator.pushNamed(context, '/');
  //           break;
  //         case 1:
  //           Navigator.of(context)
  //               .push(MaterialPageRoute(builder: (context) => FavoritePage()));

  //           break;
  //         case 2:
  //           Navigator.pushNamed(context, '/route');
  //           break;
  //         case 3:
  //           Navigator.pushNamed(context, '/settings');
  //           break;
  //       }
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
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
        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: MyRed,
        //   items: [

        //   BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.map_outlined,
        //         size: 27,
        //         color: Colors.white,
        //       ),
        //       label: 'Карта',
        //       backgroundColor: MyRed),
        //   BottomNavigationBarItem(
        //       icon: Icon(
        //         CustomIcons.star_empty,
        //         size: 27,
        //         color: Colors.white,
        //       ),
        //       label: 'Избранное',
        //       backgroundColor: MyRed),
        //   BottomNavigationBarItem(
        //       icon: Icon(
        //         CustomIcons.route,
        //         color: Colors.white,
        //       ),
        //       label: 'Маршруты',
        //       backgroundColor: MyRed),
        // ],
        // unselectedItemColor: Colors.white,
        // selectedItemColor: Colors.blue,
        // onTap: _onItemTap,
        // currentIndex: _selectedIndex,
        //   ),
      ),
    );
  }
}
