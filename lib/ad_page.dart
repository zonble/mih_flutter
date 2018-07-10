import 'package:flutter/material.dart';
import 'api.dart';
import 'photo_hero.dart';

class AdPage extends StatefulWidget {
  final Ad ad;

  AdPage({Key key, this.ad});

  @override
  State<StatefulWidget> createState() => new AdPageState();
}

class AdPageState extends State<AdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.widget.ad.name),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
                child: PhotoHero(
              imageURL: this.widget.ad.imageURL,
              width: MediaQuery.of(context).size.width,
            ))
          ],
        )));
  }
}
