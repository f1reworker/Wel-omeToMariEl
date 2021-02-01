import 'package:flutter/material.dart';
import 'package:welcome_to_mari_el/searchPage/DistrictsFilter.dart';
import 'package:welcome_to_mari_el/searchPage/searchFilter.dart';

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
          DistrictsFilter(),
          SearchFilter(),
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

class DistrictsFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: PrimaryColor),
        margin: EdgeInsets.all(10),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(40.0)),
          child: Row(children: [
            Icon(Icons.add),
            Text("     Добавить фильтры районов"),
          ]),
          onPressed: () {
            showAlertDialogDistricts(context);
          },
        ));
  }
}

class SearchFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: PrimaryColor),
        margin: EdgeInsets.all(10),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(40.0)),
          child: Row(children: [
            Icon(Icons.add),
            Text("     Добавить фильтры поиска"),
          ]),
          onPressed: () {
            showAlertDialogSearch(context);
          },
        ));
  }
}

class Fil extends StatefulWidget {
  @override
  FilState createState() => new FilState();
}

class FilState extends State<Fil> {
  @override
  Widget build(BuildContext context) {
    districtsCheckFunc();
    searchCheckFunc();
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: PrimaryColor),
            margin: EdgeInsets.all(10),
            child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(40.0)),
                child: Row(children: [
                  Icon(Icons.check),
                  Text("     Применить фильтры"),
                ]),
                onPressed: () {
                  setState(() {
                    districtsCheckFunc();
                    searchCheckFunc();
                  });
                }),
          ),
          Text(districtsString),
          Text(searchString),
        ],
      ),
    );
  }
}
