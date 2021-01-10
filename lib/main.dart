import 'package:flutter/material.dart';
import 'package:welcome_to_mari_el/searchBar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mari El Travel book',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        backgroundColor: PrimaryColor,
        //textTheme: GoogleFonts.marmeladTextTheme(
        //  Theme.of(context).textTheme,
        // ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/second': (context) => SearchList(),
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
          Navigator.pushNamed(context, '/second');
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
      height: MediaQuery.of(context).size.height - 150,
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
            height: 80,
            width: 80,
            margin: EdgeInsets.only(bottom: 20),
            child: FloatingActionButton(
              heroTag: null,
              child: Icon(Icons.settings),
              onPressed: () {},
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: PrimaryColor,
            ),
            height: 80,
            width: 80,
            margin: EdgeInsets.only(bottom: 20),
            child: FloatingActionButton(
              heroTag: null,
              child: Icon(Icons.navigation),
              onPressed: () {},
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: PrimaryColor,
            ),
            height: 80,
            width: 80,
            margin: EdgeInsets.only(bottom: 20),
            child: FloatingActionButton(
              heroTag: null,
              child: Icon(Icons.star),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}

const PrimaryColor = Color(0xFFFFFEFC);
