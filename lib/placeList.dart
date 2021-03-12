import 'package:provider/provider.dart';
import 'package:welcome_to_mari_el/custom_icons.dart';
//import 'package:welcome_to_mari_el/data.dart';
import 'package:flutter/material.dart';
import 'placeListTab.dart';

//import 'package:welcome_to_mari_el/searchPage/DistrictsFilter.dart';
//import 'package:welcome_to_mari_el/searchPage/searchFilter.dart';
List favoritePlace = [];
List finalPlace = place;
void filterPlace(districtsCheck, searchCheck) {
  finalPlace = [];
  for (int i = 0; i < place.length; i++) {
    if (districtsCheck.indexOf(place[i]["id"].split("")[0]) != -1 &&
        searchCheck.indexOf(place[i]["id"].split("")[1]) != -1) {
      finalPlace.add(place[i]);
    }
  }
}

List _data = finalPlace;

class FilteredPlace with ChangeNotifier {
  List get getData => _data;
  void changeFinalPlace(finalPlace) {
    _data = finalPlace;
    notifyListeners();
  }
}

class PlaceList extends StatelessWidget {
  const PlaceList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FilteredPlace>(create: (_) => FilteredPlace()),
        ChangeNotifierProvider<FavoritePlace>(create: (_) => FavoritePlace()),
      ],
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: new ListView.builder(
            itemCount: context.watch<FilteredPlace>().getData.length,
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
                              child:
                                  Image.network(finalPlace[index]["photo"][0]),
                            ),
                          ),
                          Column(children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(width: 10),
                                Text(
                                  finalPlace[index]["id"],
                                  textAlign: TextAlign.left,
                                  style: new TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              finalPlace[index]["district"],
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                //SizedBox(width: 10),
                                Text(
                                  finalPlace[index]["what"],
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
                            child: RaisedButton(
                              onPressed: () {
                                context
                                    .read<FavoritePlace>()
                                    .changeFavoritePlace(finalPlace, index);
                              },
                              child: Icon(CustomIcons.star_empty),
                            ),
                          ))),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          width: 40,
                          child: Center(
                            child: RaisedButton(
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

class FavoritePlace with ChangeNotifier {
  List get getData => favoritePlace;
  void changeFavoritePlace(finalPlace, index) {
    favoritePlace.add(finalPlace[index]);
    notifyListeners();
  }
}
