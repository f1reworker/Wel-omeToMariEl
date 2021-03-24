import 'package:provider/provider.dart';
import 'package:welcome_to_mari_el/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:welcome_to_mari_el/mainPage/Map.dart';
//import 'package:welcome_to_mari_el/favoritePage/favorite.dart';
//import 'package:welcome_to_mari_el/searchPage/searchFilter.dart';
import 'placeListTab.dart';
//import 'searchPage/searchBar.dart';
//import 'package:welcome_to_mari_el/searchPage/placePage.dart';

List favoritePlace = [];
List routePlace = [];
List finalPlace = place;
List data = placeOrSearch;
int indexPlace;

void filterPlace(districtsCheck, searchCheck) {
  finalPlace = [];
  for (int i = 0; i < place.length; i++) {
    if (districtsCheck.indexOf(place[i]["id"].split("")[0]) != -1 &&
        searchCheck.indexOf(place[i]["id"].split("")[1]) != -1) {
      finalPlace.add(place[i]);
      placeOrSearch = finalPlace;
    }
  }
}

List placeOrSearch = finalPlace;

class FilteredPlace with ChangeNotifier {
  List get getData => data;
  void changeFinalPlace(placeOrSearch) {
    data = placeOrSearch;
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
                  height: 101.4,
                  child: Row(children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width - 80,
                      child: TextButton(
                        onPressed: () {
                          indexPlace = place.indexOf(placeOrSearch[index]);
                          Navigator.pushNamed(context, '/place');
                        },
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
                                    placeOrSearch[index]["photo"][0]),
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
                                      placeOrSearch[index]["name"],
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
                                placeOrSearch[index]["district"],
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
                                      .changeFavoritePlace(
                                          placeOrSearch, index);
                                  indexPlace =
                                      place.indexOf(placeOrSearch[index]);
                                  onAddMarker(indexPlace);
                                },
                                icon: Icon(
                                    context
                                                .watch<FavoritePlace>()
                                                .getData
                                                .indexOf(
                                                    placeOrSearch[index]) !=
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
                                  onPressed: () {
                                    context
                                        .read<FavoritePlace>()
                                        .changeRoutePlace(placeOrSearch, index);
                                  },
                                  icon: Icon(CustomIcons.route,
                                      size: 25,
                                      color: context
                                                  .watch<FavoritePlace>()
                                                  .getData2
                                                  .indexOf(
                                                      placeOrSearch[index]) !=
                                              -1
                                          ? Colors.blueAccent
                                          : Colors.black87),
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
  List data = favoritePlace;
  List get getData => data;
  void changeFavoritePlace(placeOrSearch, index) {
    favoritePlace.indexOf(placeOrSearch[index]) != -1
        ? favoritePlace.remove(placeOrSearch[index])
        : favoritePlace.add(placeOrSearch[index]);
    data = favoritePlace;
    notifyListeners();
  }

  void refreshFavPlace(favoritePlace) {
    data = favoritePlace;
    print(data);
    notifyListeners();
  }

  List get getData2 => routePlace;
  void changeRoutePlace(placeOrSearch, index) {
    routePlace.indexOf(placeOrSearch[index]) != -1
        ? routePlace.remove(placeOrSearch[index])
        : routePlace.add(placeOrSearch[index]);
    notifyListeners();
  }
}
