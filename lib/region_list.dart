import 'package:flutter/material.dart';
import 'package:moneyinfohub/ad_list.dart';
import 'package:moneyinfohub/api.dart';

class RegionList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RegionListState();
  }
}

class RegionListState extends State<RegionList> {
  @override
  Widget build(BuildContext context) {
    final regions = MoneyInfoHubAPI.regions();
    return new ListView.builder(
        itemCount: regions.length,
        itemBuilder: (context, index) {
          var region = regions[index];
          return new ListTile(
            title: Text(region[0]),
            onTap: () {
              AdListPage page = AdListPage(
                title: region[0],
                future: MoneyInfoHubAPI.fetchAdsForRegion(region[1]),
              );

              Navigator
                  .of(context)
                  .push(MaterialPageRoute(builder: (context) => page));
            },
          );
        });

    // TODO: Implement build
  }
}
