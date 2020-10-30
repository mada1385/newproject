import 'package:flutter/cupertino.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/config/mediaqueryconfig.dart';
import 'package:gulf_football/models/match.dart';

class Statsscreen extends StatelessWidget {
  final SoccerMatch match;

  const Statsscreen({Key key, this.match}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Statrow(
                  match: match,
                  index: 0,
                ),
                Statrow(
                  match: match,
                  index: 1,
                ),
                Statrow(
                  match: match,
                  index: 2,
                ),
                Statrow(
                  match: match,
                  index: 3,
                ),
                Statrow(
                  match: match,
                  index: 4,
                ),
                Statrow(
                  match: match,
                  index: 5,
                ),
                Statrow(
                  match: match,
                  index: 6,
                ),
                Statrow(
                  match: match,
                  index: 7,
                ),
                Statrow(
                  match: match,
                  index: 8,
                ),
                Statrow(
                  match: match,
                  index: 9,
                ),
                Statrow(
                  match: match,
                  index: 10,
                ),
                Statrow(
                  match: match,
                  index: 11,
                ),
                Statrow(
                  match: match,
                  index: 12,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Statrow extends StatelessWidget {
  const Statrow({Key key, @required this.match, @required this.index})
      : super(key: key);

  final SoccerMatch match;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          match.stats.stats[index]["home"],
          style: TextStyle(
              color: accentcolor, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Text(
          match.stats.stats[index]["type"],
          style: TextStyle(
            color: textcolor,
            fontSize: 20,
          ),
        ),
        Text(
          match.stats.stats[index]["away"],
          style: TextStyle(
              color: textcolor, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
