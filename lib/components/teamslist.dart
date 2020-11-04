import 'package:flutter/material.dart';
import 'package:gulf_football/components/texts.dart';
import 'package:gulf_football/models/Leagues.dart';
import 'package:gulf_football/models/country.dart';
import 'package:gulf_football/models/teams.dart';

class Teamslist extends StatelessWidget {
  final List<Teams> teams;

  const Teamslist({
    Key key,
    @required this.teams,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 2,
                    offset: Offset(0, .75))
              ]),
              child: ListTile(
                leading: Image.network(teams[index].teambadge),
                title: Contenttext(
                  data: teams[index].teamname,
                  size: 25,
                ),
                trailing: Icon(Icons.chevron_right),
              ),
            ),
          );
        },
        itemCount: teams.length,
      ),
    );
  }
}
