import 'package:flutter/material.dart';
import 'package:gulf_football/config/mediaqueryconfig.dart';
import 'package:gulf_football/models/match.dart';

Widget matchTile(SoccerMatch match, Function ontap) {
  var homeGoal = match.goal.home;
  var awayGoal = match.goal.away;
  var status = match.fixture.status.long;
  if (homeGoal == null) homeGoal = 0;
  if (awayGoal == null) awayGoal = 0;

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Card(
      elevation: 20,
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          // height: SizeConfig.blockSizeVertical * 7,
          margin: EdgeInsets.symmetric(vertical: 12.0),
          child: Column(
            children: [
              Text(
                "premiere leauge",
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      match.home.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Image.network(
                    match.home.logoUrl,
                    width: 36.0,
                  ),
                  Expanded(
                    child: Text(
                      "${homeGoal} - ${awayGoal}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                        fontSize: SizeConfig.blockSizeVertical * 4,
                      ),
                    ),
                  ),
                  Image.network(
                    match.away.logoUrl,
                    width: 36.0,
                  ),
                  Expanded(
                    child: Text(
                      match.away.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              Text(
                status,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: SizeConfig.blockSizeVertical * 2,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
