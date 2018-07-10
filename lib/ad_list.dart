import 'package:flutter/material.dart';
import 'package:moneyinfohub/api.dart';
import 'dart:async';
import 'photo_hero.dart';
import 'ad_page.dart';

class AdListPage extends StatefulWidget {
  String title;
  Future future;

  AdListPage({Key key, this.title, this.future});

  @override
  State<StatefulWidget> createState() {
    return new AdListPageState();
  }
}

class AdListPageState extends State<AdListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdList(
        future: this.widget.future,
        title: this.widget.title,
      ),
    );
  }
}

class AdList extends StatefulWidget {
  Future future;
  String title;

  AdList({Key key, this.future, this.title});

  @override
  State<StatefulWidget> createState() {
    return new AdListState();
  }
}

class AdListState extends State<AdList> {
  Widget _makeCard(Ad ad, BuildContext context) {
    return new Card(
      margin: EdgeInsets.all(10.0),
      child: new PhotoHero(
        imageURL: ad.imageURL,
        width: MediaQuery
            .of(context)
            .size
            .width,
        onTap: () {
          Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
            return new AdContentPage(
              ad: ad,
            );
          }));
        },
      ),
    );
  }

  Widget _makeCardList(List<Ad> list, String title, BuildContext context) {
    final delegate = new SliverGridDelegateWithMaxCrossAxisExtent(
        childAspectRatio: 1.2,
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 0.0,
        maxCrossAxisExtent: 250.0);
    var slivers = <Widget>[];
    if (title != null) {
      final appbar = SliverAppBar(title: Text(title),);
      slivers.add(appbar);
    }
    final gridView = SliverGrid(
        gridDelegate: delegate,
        delegate: new SliverChildListDelegate(
            list.map((ad) => _makeCard(ad, context)).toList()));
    slivers.add(gridView);
    final scrollView = CustomScrollView(
      slivers: slivers,
    );

    return Scrollbar(child: scrollView);
  }

  Widget _makeText(String text) {
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
            return _makeCardList(list, this.widget.title, context);
          } else if (snapshot.error != null) {
            return _makeText(snapshot.error.toString());
          }
          return _makeText('Loading...');
        });
  }
}
