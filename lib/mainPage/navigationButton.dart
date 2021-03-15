import 'package:flutter/material.dart';

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
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: MyRed,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(40.0)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/search');
          },
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
