import 'package:flutter/material.dart';
import 'package:welcome_to_mari_el/DistrictsFilter.dart';
import 'dart:core';

const PrimaryColor = Color(0xFFFFFEFC);
const MyRed = Color(0xFFFF6860);

class SearchList extends StatefulWidget {
  @override
  SearchListState createState() => new SearchListState();
}

class SearchListState extends State<SearchList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: PrimaryColor,
        child: Column(children: <Widget>[
          SearchBar(),
          Filter(),
          Fil(),
        ]),
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
        height: 40,
        margin: EdgeInsets.all(10),
        child: TextField(
            onChanged: onTextChange,
            decoration: InputDecoration(
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                prefixIcon: Icon(Icons.search),
                hintText: 'Search something ...',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide.none),
                contentPadding: EdgeInsets.zero)));
  }
}

class Filter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        margin: EdgeInsets.all(10),
        child: RaisedButton(
          onPressed: () {
            showAlertDialog(context);
          },
        ));
  }
}

class Fil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (gornVal == true) {
      return Text("Горн");
    } else {
      return Text("No");
    }
  }
}
