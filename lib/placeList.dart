import 'package:welcome_to_mari_el/data.dart';
import 'package:flutter/material.dart';
import 'placeListTab.dart';

String id = lakeKumyary["id"].split("")[0];
List place = [lakeKumyary, oakPugachev];
List finalPlace = place;
List ddd = DistrictsFil().getData1;
void filterPlace() {
  finalPlace = [];
  for (int i = 0; i < place.length; i++) {
    if ((place[i]["id"].split[0])) {
      finalPlace.add(place[i]);
    }
  }
}

class PlaceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("data"),
    );
  }
}
