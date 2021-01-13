import 'package:flutter/material.dart';

const PrimaryColor = Color(0xFFFFFEFC);

class SearchList extends StatelessWidget {
  SearchList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: PrimaryColor,
        child: Column(children: <Widget>[
          SearchBar(),
          Filter(),
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

// class Filters extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(

//     );
//   }
// }
class Filter extends StatelessWidget {
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
        onPressed: () => {OpenFilter()},
        child: Row(
          children: [
            Icon(Icons.arrow_drop_down),
            Text("Фильтры"),
          ],
        ),
      ),
    );
  }
}

class OpenFilter extends StatelessWidget {
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
        onPressed: () => {OpenFilterDistricts()},
        child: Row(
          children: [
            Icon(Icons.arrow_drop_down),
            Text("      Районы"),
          ],
        ),
      ),
    );
  }
}

class OpenFilterDistricts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Медведевский"));
  }
}
