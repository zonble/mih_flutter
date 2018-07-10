import 'package:flutter/material.dart';
import 'api.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Money Info Hub',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new HomePage(title: 'Money Info Hub'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _makeCard(Ad ad) {
    return new Card(
      margin: EdgeInsets.all(10.0),
      child: new DecoratedBox(
          decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              image: new DecorationImage(
                  fit: BoxFit.fitWidth, image: NetworkImage(ad.imageURL)))),
    );
  }

  _makeCardList(List<Ad> list) {
    final delegate = new SliverGridDelegateWithMaxCrossAxisExtent(
        childAspectRatio: 1.2,
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 0.0,
        maxCrossAxisExtent: 250.0);
    return new Scrollbar(
      child: new GridView.builder(
          itemCount: list.length,
          gridDelegate: delegate,
          itemBuilder: (context, index) {
            Ad ad = list[index];
            return _makeCard(ad);
          }),
    );
  }

  _makeText(String text) {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[new Text(text)],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new FutureBuilder(
            future: MoneyInfoHubAPI.fetchAds(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                List<Ad> list = snapshot.data;
                return _makeCardList(list);
              } else if (snapshot.error != null) {
                return _makeText(snapshot.error.toString());
              }
              return _makeText('Loading');
            }));
  }
}
