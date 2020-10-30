import 'package:flutter/material.dart';
import 'package:gulf_football/models/match.dart';

class Lineupscreen extends StatelessWidget {
  final SoccerMatch match;
  void sort() {
    // match.lineup.lineuphome.sort();
  }

  const Lineupscreen({Key key, this.match}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Text(match.lineup.lineuphome[index]["lineup_player"]);
        },
        itemCount: match.lineup.lineuphome.length,
      ),
    );
  }
}
