import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

const APIEndPoint = 'https://www.3wyp.com/adjs/u95-tw/aditem.js';

class Ad {
  String name = '';
  String url = '';
  String imageURL = '';

  Ad(this.name, this.url, this.imageURL);
}

class MoneyInfoHubAPI {
  static Future<List<Ad>> fetchAds() async {
    final response = await http.get(APIEndPoint);

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
}
