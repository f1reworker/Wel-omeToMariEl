import 'package:flutter/material.dart';
//import 'package:photo_view/photo_view.dart';

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
      home: HomePage(),
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
            SearchBar(),
            Flexible(child: Map()),
            Buttons(),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final void Function(String) onTextChange;

  SearchBar({this.onTextChange});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: PrimaryColor,
        ),
        height: 50,
        padding: EdgeInsets.all(8),
        child: TextField(
            onChanged: onTextChange,
            decoration: InputDecoration(
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                prefixIcon: Icon(Icons.search),
                hintText: 'Поиск ...',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                contentPadding: EdgeInsets.zero)));
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
        scrollDirection: Axis.horizontal, // <-- Like so
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
