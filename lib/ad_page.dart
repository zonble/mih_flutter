import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:moneyinfohub/api.dart';
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
          ],
        )));
  }
}
