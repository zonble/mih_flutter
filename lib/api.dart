import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

const APIEndPoint = 'https://www.3wyp.com/adjs/u95-tw/';

class Ad {
  String name = '';
  String url = '';
  String imageURL = '';

  Ad(this.name, this.url, this.imageURL);
}

class MoneyInfoHubAPI {
  static List<List<String>> regions() {
    return [
      ["北區", "aditem3"],
      ["台北", "aditem4"],
      ["桃園", "aditem5"],
      ["新竹", "aditem6"],
      ["苗栗", "aditem7"],
      ["基隆", "aditem8"],
      ["宜蘭", "aditem9"],
      ["中區", "aditem10"],
      ["台中", "aditem11"],
      ["彰化", "aditem12"],
      ["南投", "aditem13"],
      ["雲林", "aditem14"],
      ["花蓮", "aditem15"],
      ["南區", "aditem16"],
      ["高雄", "aditem17"],
      ["台南", "aditem18"],
      ["嘉義", "aditem19"],
      ["屏東", "aditem20"],
      ["台東", "aditem21"]
    ];
  }

  static Future<List<Ad>> fetchAdsForRegion(String region) async {
    final response = await http.get(APIEndPoint + region + '.js');

    final html = UTF8.decode(response.bodyBytes);
    final regex = RegExp(
        "<a href=\"(.*)\" target=\"_blank\"><img alt=\"(.*)\" src=\"(.*)\" style=\"width: (.*)px;\" /></a>");
    var matches = regex.allMatches(html);
    return matches.map((match) {
      final url = match.group(1).trim();
      final name = match.group(2).trim();
      final imageURL = match.group(3).trim();
      return Ad(name, url, imageURL);
    }).toList();
  }

  static Future<List<Ad>> fetchAds() async {
    return fetchAdsForRegion('aditem');
  }
}
