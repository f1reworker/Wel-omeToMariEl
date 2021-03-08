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
bool sightVal = true;
List searchCheck = [
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
];
showAlertDialogSearch(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      searchCheckFunc();
      context.read<DistrictsFil>().changeString2(searchCheck);
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
      children: <Widget>[
        Checkbox(
          value: boolValue,
          onChanged: (bool value) {
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
                case "Достопримечательности":
                  sightVal = value;
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
                    checkbox("Достопримечательности", sightVal),
                    Text("Достопримечательности")
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
  searchCheck = [];
  if (museumVal == true) {
    searchCheck.add("1");
  }
  if (galeryVal == true) {
    searchCheck.add("2");
  }
  if (naturalVal == true) {
    searchCheck.add("3");
  }
  if (holyVal == true) {
    searchCheck.add("4");
  }
  if (sightVal == true) {
    searchCheck.add("5");
  }
  if (cafeVal == true) {
    searchCheck.add("6");
  }
  if (restVal == true) {
    searchCheck.add("7");
  }
  if (hotelVal == true) {
    searchCheck.add("8");
  }
  if (hostelVal == true) {
    searchCheck.add("9");
  }
}
