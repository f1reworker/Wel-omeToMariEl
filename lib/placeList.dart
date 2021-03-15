import 'package:provider/provider.dart';
import 'package:welcome_to_mari_el/custom_icons.dart';
//import 'package:welcome_to_mari_el/data.dart';
import 'package:flutter/material.dart';
import 'placeListTab.dart';
import 'package:webdav/webdav.dart';

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
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FilteredPlace>(create: (_) => FilteredPlace()),
        ChangeNotifierProvider<FavoritePlace>(create: (_) => FavoritePlace()),
      ],
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: new ListView.separated(
            itemCount: context.watch<FilteredPlace>().getData.length,
            separatorBuilder: (context, index) => Divider(
              color: Colors.black,
            ),
            itemBuilder: (context, index) {
              return new Container(
                  height: 90,
                  child: Row(children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width - 80,
                      child: TextButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white, onPrimary: Colors.black),
                        child: Row(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 70,
                                decoration:
                                    BoxDecoration(shape: BoxShape.circle),
                                child: Image.network(
                                    finalPlace[index]["photo"][0]),
                              ),
                            ),
                            Column(children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(width: 10),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 176,
                                    child: Text(
                                      finalPlace[index]["name"],
                                      softWrap: true,
                                      textAlign: TextAlign.left,
                                      style: new TextStyle(
                                        fontSize: 15.0,
                                      ),
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
                            ]),
                          ],
                        ),
                      ),
                    ),
                    Stack(children: <Widget>[
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 25,
                              height: 70,
                              child: IconButton(
                                onPressed: () {
                                  context
                                      .read<FavoritePlace>()
                                      .changeFavoritePlace(finalPlace, index);
                                },
                                icon: Icon(
                                    context
                                                .watch<FavoritePlace>()
                                                .getData
                                                .indexOf(finalPlace[index]) !=
                                            -1
                                        ? Icons.star_outlined
                                        : Icons.star_outline_sharp,
                                    color: Colors.amber,
                                    size: 35),
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              width: 25,
                              child: Center(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(CustomIcons.route, size: 25),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ]));
            },
          )),
    );
  }
}

class FavoritePlace with ChangeNotifier {
  List get getData => favoritePlace;
  void changeFavoritePlace(finalPlace, index) {
    favoritePlace.indexOf(finalPlace[index]) != -1
        ? favoritePlace.remove(finalPlace[index])
        : favoritePlace.add(finalPlace[index]);
    notifyListeners();
  }
}
