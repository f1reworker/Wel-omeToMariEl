import 'package:flutter/material.dart';
import 'package:welcome_to_mari_el/custom_icons.dart';
import 'package:welcome_to_mari_el/favoritePage/favorite.dart';

const MyRed = Color(0xFFFF6860);

class SearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 30,
        ),
        child: RaisedButton(
          color: MyRed,
          onPressed: () {
            Navigator.pushNamed(context, '/search');
          },
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(40.0)),
          child: Row(children: [
            Icon(
              Icons.search,
              color: Colors.white,
            ),
            Text(
              "      Поиск...",
              style: TextStyle(color: Colors.white),
            ),
          ]),
        ),
      ),
    );
  }
}

// class Buttons extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: Container(
//         padding: const EdgeInsets.all(20.0),
//         //margin: EdgeInsets.only(bottom: 20),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             //SizedBox(height: 210),
//             Container(
//               height: 70,
//               width: 70,
//               child: FloatingActionButton(
//                 heroTag: null,
//                 child: Icon(
//                   CustomIcons.cog,
//                   size: 50,
//                 ),
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/settings');
//                 },
//                 backgroundColor: MyRed,
//               ),
//             ),
//             //SizedBox(height: 20),
//             Container(
//               height: 70,
//               width: 70,
//               child: FloatingActionButton(
//                 heroTag: null,
//                 child: Icon(CustomIcons.route, size: 40),
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/route');
//                 },
//                 backgroundColor: MyRed,
//               ),
//             ),
//             //SizedBox(height: 20),
//             Container(
//               height: 70,
//               width: 70,
//               child: FloatingActionButton(
//                 heroTag: null,
//                 child: Icon(CustomIcons.star_empty, size: 55),
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/favorite');
//                 },
//                 backgroundColor: MyRed,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class Buttons extends StatefulWidget {
  Buttons({Key key}) : super(key: key);
  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  int _selectedIndex = 0;
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.pushNamed(context, '/');
          break;
        case 1:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => FavoritePage()));

          break;
        case 2:
          Navigator.pushNamed(context, '/route');
          break;
        case 3:
          Navigator.pushNamed(context, '/settings');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.map_outlined, color: MyRed),
                label: 'Карта',
                backgroundColor: Colors.teal),
            BottomNavigationBarItem(
                icon: Icon(
                  CustomIcons.star_empty,
                  color: MyRed,
                ),
                label: 'Избранное',
                backgroundColor: Colors.cyan),
            BottomNavigationBarItem(
              icon: Icon(
                CustomIcons.route,
                color: MyRed,
                size: 37,
              ),
              label: 'Маршруты',
              backgroundColor: Colors.amber,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CustomIcons.cog,
                color: MyRed,
              ),
              label: 'Настройки',
              backgroundColor: Colors.lightBlue,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          iconSize: 40,
          onTap: _onItemTap,
          elevation: 5),
    );
  }
}
