import 'dart:convert';

import 'package:gulf_football/models/match.dart';
import 'package:http/http.dart';

class SoccerApi {
  // final String apiUrl =
  //In our tutorial we will only see how to get the live matches
  //make sure to read the api documentation to be ables too understand it

  // you will find your api key in your dashboard
  //so create your account it's free
  //Now let's add the headers

  //Now we will create our method
  //but before this we need to create our model

  //Now we finished with our Model
  Future<List<SoccerMatch>> getAllMatches(String leaugeid) async {
    String id = "&league_id=$leaugeid";
    Response res = await get(
        "https://apiv2.apifootball.com/?action=get_events&from=2019-04-01&to=2019-04-01${leaugeid == null ? null : id}&APIkey=290ec875c73e45bba490754b61ba1c1dabf300d2d30d5dd81bb25eab35f59a16");
    print(res.statusCode);
    var body;

    if (res.statusCode == 200) {
      // this mean that we are connected to the data base
      body = jsonDecode(res.body);
      if (res.body.length > 1) {
        List<dynamic> matchesList = body;
        print("Api service: ${body}"); // to debug
        List<SoccerMatch> matches = matchesList
            .map((dynamic item) => SoccerMatch.fromJson(item))
            .toList();
        return matches;
      } else {
        return null;
      }
    }
  }
}
