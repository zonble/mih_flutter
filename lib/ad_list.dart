import 'package:flutter/material.dart';
import 'dart:async';
import 'api.dart';
import 'photo_hero.dart';
import 'ad_page.dart';


class AdList extends StatefulWidget {
  Future future;
  AdList({Key key, this.future});

  @override
  State<StatefulWidget> createState() {
    return new AdListState();
  }
}

class AdListState extends State<AdList> {

  _makeCard(Ad ad, BuildContext context) {
    return new Card(
      margin: EdgeInsets.all(10.0),
      child: new PhotoHero(
        imageURL: ad.imageURL,
        width: MediaQuery.of(context).size.width,
        onTap: () {
          Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
            return new AdPage(
              ad: ad,
            );
          }));
        },
      ),
    );
  }

  _makeCardList(List<Ad> list, BuildContext context) {
    final delegate = new SliverGridDelegateWithMaxCrossAxisExtent(
        childAspectRatio: 1.2,
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 0.0,
        maxCrossAxisExtent: 250.0);
    return Scrollbar(
      child: GridView.builder(
          itemCount: list.length,
          gridDelegate: delegate,
          itemBuilder: (context, index) {
            Ad ad = list[index];
            return _makeCard(ad, context);
          }),
    );
  }

  _makeText(String text) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[new Text(text)],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
        future: this.widget.future,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            List<Ad> list = snapshot.data;
            return _makeCardList(list, context);
          } else if (snapshot.error != null) {
            return _makeText(snapshot.error.toString());
          }
          return _makeText('Loading...');
        });
  }
}