import 'dart:convert';

import 'package:gulf_football/models/match.dart';
import 'package:http/http.dart';

class StandiingAPI {
  getTable() async {
    var response = await get(
      'https://apiv2.apifootball.com/?action=get_standings&league_id=148&APIkey=290ec875c73e45bba490754b61ba1c1dabf300d2d30d5dd81bb25eab35f59a16',
    );
    String body = response.body;
    print("response is : ${response.statusCode.toString()}");
    List data = jsonDecode(body);
    // List table = data[0];
    return data;
  }
}
