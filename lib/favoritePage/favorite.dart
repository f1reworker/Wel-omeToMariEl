import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:welcome_to_mari_el/placeList.dart';
import 'package:welcome_to_mari_el/custom_icons.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FavoritePlace>(
      create: (context) => FavoritePlace(),
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: new ListView.builder(
            itemCount: context.watch<FavoritePlace>().getData.length,
            itemBuilder: (context, index) {
              return new Container(
                height: 80,
                child: Row(children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 80,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, onPrimary: Colors.black),
                      child: Row(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 70,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: Image.network(
                                  favoritePlace[index]["photo"][0]),
                            ),
                          ),
                          Column(children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(width: 10),
                                Text(
                                  favoritePlace[index]["id"],
                                  textAlign: TextAlign.left,
                                  style: new TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              favoritePlace[index]["district"],
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                //SizedBox(width: 10),
                                Text(
                                  favoritePlace[index]["what"],
                                  textAlign: TextAlign.left,
                                  style: new TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          width: 40,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Icon(CustomIcons.star_empty),
                            ),
                          ))),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          width: 40,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Icon(CustomIcons.route),
                            ),
                          ))),
                ]),
              );
            },
          )),
    );
  }
}
