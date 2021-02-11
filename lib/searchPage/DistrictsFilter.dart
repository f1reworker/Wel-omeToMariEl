import 'package:flutter/material.dart';
import 'dart:convert';

bool urVal = true;
bool mariVal = true;
bool paranVal = true;
bool sernVal = true;
bool kugVal = true;
bool novVal = true;
bool volgVal = true;
bool sovVal = true;
bool morkVal = true;
bool orshVal = true;
bool zvenVal = true;
bool medvVal = true;
bool kilVal = true;
bool gornVal = true;
var districtsCheck = [];
String districtsString;

showAlertDialogDistricts(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      //districtsCheckFunc();
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30))),
    title: Text("Выберите районы:"),
    content: Container(
        height: MediaQuery.of(context).size.height - 200,
        width: MediaQuery.of(context).size.width - 100,
        child: Districts()),
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

class Districts extends StatefulWidget {
  @override
  DistrictsState createState() => new DistrictsState();
}

class DistrictsState extends State<Districts> {
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
                case "Юринский":
                  urVal = value;
                  break;
                case "Мари-Турекский":
                  mariVal = value;
                  break;
                case "Параньгинский":
                  paranVal = value;
                  break;
                case "Сернурский":
                  sernVal = value;
                  break;
                case "Куженерский":
                  kugVal = value;
                  break;
                case "Новоторъяльский":
                  novVal = value;
                  break;
                case "Волжский":
                  volgVal = value;
                  break;
                case "Моркинский":
                  morkVal = value;
                  break;
                case "Советский":
                  sovVal = value;
                  break;
                case "Оршанский":
                  orshVal = value;
                  break;
                case "Звениговский":
                  zvenVal = value;
                  break;
                case "Медведевский":
                  medvVal = value;
                  break;
                case "Килемарский":
                  kilVal = value;
                  break;
                case "Горномарийский":
                  gornVal = value;
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
              Row(children: <Widget>[
                checkbox("Юринский", urVal),
                Text("Юринский")
              ]),
              Row(children: <Widget>[
                checkbox("Мари-Турекский", mariVal),
                Text("Мари-Турекский")
              ]),
              Row(children: <Widget>[
                checkbox("Параньгинский", paranVal),
                Text("Параньгинский")
              ]),
              Row(children: <Widget>[
                checkbox("Сернурский", sernVal),
                Text("Сернурский")
              ]),
              Row(children: <Widget>[
                checkbox("Куженерский", kugVal),
                Text("Куженерский")
              ]),
              Row(children: <Widget>[
                checkbox("Новоторъяльский", novVal),
                Text("Новоторъяльский")
              ]),
              Row(children: <Widget>[
                checkbox("Волжский", volgVal),
                Text("Волжский")
              ]),
              Row(children: <Widget>[
                checkbox("Моркинский", morkVal),
                Text("Моркинский")
              ]),
              Row(children: <Widget>[
                checkbox("Советский", sovVal),
                Text("Советский")
              ]),
              Row(children: <Widget>[
                checkbox("Оршанский", orshVal),
                Text("Оршанский")
              ]),
              Row(children: <Widget>[
                checkbox("Звениговский", zvenVal),
                Text("Звениговский")
              ]),
              Row(children: <Widget>[
                checkbox("Медведевский", medvVal),
                Text("Медведевский")
              ]),
              Row(children: <Widget>[
                checkbox("Килемарский", kilVal),
                Text("Килемарский")
              ]),
              Row(children: <Widget>[
                checkbox("Горномарийский", gornVal),
                Text("Горномарийский")
              ]),
            ],
          ),
        ],
      ),
    );
  }
}

void districtsCheckFunc() {
  var districtsCheck = [];
  if (urVal == true) {
    districtsCheck.add("Юринский");
  }
  if (mariVal == true) {
    districtsCheck.add("Мари-Турекский");
  }
  if (paranVal == true) {
    districtsCheck.add("Параньгинский");
  }
  if (sernVal == true) {
    districtsCheck.add("Сернурский");
  }
  if (kugVal == true) {
    districtsCheck.add("Куженерский");
  }
  if (novVal == true) {
    districtsCheck.add("Новоторъяльский");
  }
  if (volgVal == true) {
    districtsCheck.add("Волжский");
  }
  if (morkVal == true) {
    districtsCheck.add("Моркинский");
  }
  if (sovVal == true) {
    districtsCheck.add("Советский");
  }
  if (orshVal == true) {
    districtsCheck.add("Оршанский");
  }
  if (zvenVal == true) {
    districtsCheck.add("Звениговский");
  }
  if (medvVal == true) {
    districtsCheck.add("Медведевский");
  }
  if (kilVal == true) {
    districtsCheck.add("Килемарский");
  }
  if (gornVal == true) {
    districtsCheck.add("Горномарийский");
  }
  districtsString = jsonEncode(districtsCheck);
}
