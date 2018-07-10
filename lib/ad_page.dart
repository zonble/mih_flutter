import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:moneyinfohub/api.dart';
import 'photo_hero.dart';

class AdContentPage extends StatefulWidget {
  final Ad ad;

  AdContentPage({Key key, this.ad});

  @override
  State<StatefulWidget> createState() => new AdContentPageState();
}

class AdContentPageState extends State<AdContentPage> {
  @override
  Widget build(BuildContext context) {
    var scrollView = CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.white,
          textTheme: TextTheme(
              title: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w300)),
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(this.widget.ad.name),
          pinned: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
                width: MediaQuery.of(context).size.width,
                child: PhotoHero(
                  imageURL: this.widget.ad.imageURL,
                  width: MediaQuery.of(context).size.width,
                )),
            Container(
              padding: EdgeInsets.all(20.0),
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  var url = this.widget.ad.url;
                  print(url);
                  launch(url);
                },
                child: Text(
                  'Visit Web Site',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ]),
        )
      ],
    );

    return Scaffold(body: SafeArea(child: scrollView));
  }
}
