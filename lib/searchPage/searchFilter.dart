import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:welcome_to_mari_el/data.dart';
import 'package:flutter/material.dart';
//import 'package:welcome_to_mari_el/searchPage/DistrictsFilter.dart';

bool museumVal = true;
bool galeryVal = true;
bool naturalVal = true;
bool holyVal = true;
bool cafeVal = true;
bool restVal = true;
bool hotelVal = true;
bool hostelVal = true;
var searchCheck = [];
String searchString = "";
String districtsString = "";
showAlertDialogSearch(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      searchCheckFunc();
      context.read<DistrictsFil>().changeString(searchString);
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30))),
    title: Text("Выберите то, что хотите найти:"),
    content: Container(
        height: 400,
        width: MediaQuery.of(context).size.width - 100,
        child: Search()),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class Search extends StatefulWidget {
  @override
  SearchState createState() => new SearchState();
}

class SearchState extends State<Search> {
  Widget checkbox(String title, bool boolValue) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Checkbox(
          value: boolValue,
          onChanged: (bool value) {
            /// manage the state of each value
            setState(() {
              switch (title) {
                case "Музеи":
                  museumVal = value;
                  break;
                case "Галереи":
                  galeryVal = value;
                  break;
                case "Природные места":
                  naturalVal = value;
                  break;
                case "Святые места":
                  holyVal = value;
                  break;
                case "Кафе":
                  cafeVal = value;
                  break;
                case "Рестораны":
                  restVal = value;
                  break;
                case "Отели":
                  hotelVal = value;
                  break;
                case "Хостелы":
                  hostelVal = value;
                  break;
              }
            });
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(children: <Widget>[
                    checkbox("Музеи", museumVal),
                    Text("Музеи")
                  ]),
                  Row(children: <Widget>[
                    checkbox("Галереи", galeryVal),
                    Text("Галереи")
                  ]),
                  Row(children: <Widget>[
                    checkbox("Природные места", naturalVal),
                    Text("Природные места")
                  ]),
                  Row(children: <Widget>[
                    checkbox("Святые места", holyVal),
                    Text("Святые места")
                  ]),
                  Row(children: <Widget>[
                    checkbox("Кафе", cafeVal),
                    Text("Кафе")
                  ]),
                  Row(children: <Widget>[
                    checkbox("Рестораны", restVal),
                    Text("Рестораны")
                  ]),
                  Row(children: <Widget>[
                    checkbox("Отели", hotelVal),
                    Text("Отели")
                  ]),
                  Row(children: <Widget>[
                    checkbox("Хостелы", hostelVal),
                    Text("Хостелы")
                  ]),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void searchCheckFunc() {
  var searchCheck = [];
  if (museumVal == true) {
    searchCheck.add("Музеи");
  }
  if (galeryVal == true) {
    searchCheck.add("Галереи");
  }
  if (naturalVal == true) {
    searchCheck.add("Природные места");
  }
  if (holyVal == true) {
    searchCheck.add("Святые места");
  }
  if (cafeVal == true) {
    searchCheck.add("Кафе");
  }
  if (restVal == true) {
    searchCheck.add("Рестораны");
  }
  if (hotelVal == true) {
    searchCheck.add("Отели");
  }
  if (hostelVal == true) {
    searchCheck.add("Хостелы");
  }
  searchString = jsonEncode(searchCheck);
}
