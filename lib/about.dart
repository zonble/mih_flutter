import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AboutState();
  }
}

class AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Money Info Hub', style: TextStyle(fontSize: 20.0),),
          Text(''),
          Text('資料來源'),
          Text('當舖搜尋網'),
          Text('http://www.u95.tw/'),
        ],
      ),
    );
  }
}
