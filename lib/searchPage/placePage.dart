import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import "package:provider/provider.dart";
import 'package:welcome_to_mari_el/placeList.dart';
import 'package:welcome_to_mari_el/placeListTab.dart';
import 'package:welcome_to_mari_el/mainPage/Map.dart';
import 'package:welcome_to_mari_el/favoritePage/favorite.dart';

class PlacePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FilteredPlace>(create: (_) => FilteredPlace()),
        ChangeNotifierProvider<FavoritePlace>(create: (_) => FavoritePlace()),
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            place[indexPlace]["name"],
          ),
          actions: <Widget>[
            new IconButton(
              onPressed: () {
                context
                    .read<FavoritePlace>()
                    .changeFavoritePlace(favoritePlace, indexPlace);
                onAddMarker(indexPlace);
                saveFavoritePlace(indexPlace);
              },
              icon: context
                          .watch<FavoritePlace>()
                          .getData
                          .indexOf(place[indexPlace]) !=
                      -1
                  ? Icon(Icons.star_outlined)
                  : Icon(Icons.star_outline_sharp),
              iconSize: 35,
              color: Colors.amber,
            ),
          ],
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(children: <Widget>[
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    child: Text(
                  "   Район: " + place[indexPlace]["district"],
                  textAlign: TextAlign.left,
                )),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    "   Категория: " + place[indexPlace]["what"],
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: (MediaQuery.of(context).size.width - 10) * 3 / 4,
                  width: MediaQuery.of(context).size.width - 10,
                  child: PhotoGalery()),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                    width: MediaQuery.of(context).size.width - 10,
                    child: Text(
                      place[indexPlace]["description"],
                      softWrap: true,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                    width: MediaQuery.of(context).size.width - 10,
                    child: Text(
                      place[indexPlace]["transport"],
                      softWrap: true,
                    )),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

class PhotoGalery extends StatefulWidget {
  PhotoGalery({Key key}) : super(key: key);

  @override
  _PhotoGaleryState createState() => _PhotoGaleryState();
}

class _PhotoGaleryState extends State<PhotoGalery> {
  final PageController _controller = new PageController();
  // ignore: unused_field
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: _controller,
        onPageChanged: (index) {
          setState(() => _pageIndex = index);
        },
        itemCount: place[indexPlace]["photo"].length - 1,
        itemBuilder: (BuildContext context, int position) {
          return Align(
              alignment: Alignment.topLeft,
              child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(place[indexPlace]["photo"]
                              .elementAt(position + 1))))));
        });
  }
}
