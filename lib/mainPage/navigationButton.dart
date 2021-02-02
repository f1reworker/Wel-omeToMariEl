import 'package:flutter/material.dart';
import 'package:welcome_to_mari_el/custom_icons.dart';

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
          vertical: 10,
        ),
        child: RaisedButton(
          color: MyRed,
          onPressed: () {
            Navigator.pushNamed(context, '/search');
          },
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(40.0)),
          child: Row(children: [
            Icon(Icons.search),
            Text("      Поиск..."),
          ]),
        ),
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        //margin: EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //SizedBox(height: 210),
            Container(
              height: 70,
              width: 70,
              child: FloatingActionButton(
                heroTag: null,
                child: Icon(
                  CustomIcons.cog,
                  size: 50,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
                backgroundColor: MyRed,
              ),
            ),
            //SizedBox(height: 20),
            Container(
              height: 70,
              width: 70,
              child: FloatingActionButton(
                heroTag: null,
                child: Icon(CustomIcons.route, size: 40),
                onPressed: () {
                  Navigator.pushNamed(context, '/route');
                },
                backgroundColor: MyRed,
              ),
            ),
            //SizedBox(height: 20),
            Container(
              height: 70,
              width: 70,
              child: FloatingActionButton(
                heroTag: null,
                child: Icon(CustomIcons.star_empty, size: 55),
                onPressed: () {
                  Navigator.pushNamed(context, '/favorite');
                },
                backgroundColor: MyRed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
