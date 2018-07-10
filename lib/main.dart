import 'package:flutter/material.dart';
import 'package:moneyinfohub/api.dart';
import 'ad_list.dart';
import 'region_list.dart';
import 'about.dart';

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
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  AdList adList = AdList(future: MoneyInfoHubAPI.fetchAds());
  RegionList regionList = RegionList();
  About about = About();

  final List<Tab> myTabs = <Tab>[
    new Tab(text: 'Home'),
    new Tab(text: 'Regions'),
    new Tab(text: 'About'),
  ];

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: myTabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: new TabBar(
            tabs: myTabs,
            controller: _tabController,
          ),
        ),
        body: new TabBarView(
            controller: _tabController, children: [adList, regionList, about]));
  }
}
