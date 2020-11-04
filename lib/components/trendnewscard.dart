import 'package:flutter/material.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/config/mediaqueryconfig.dart';
import 'package:gulf_football/models/news.dart';

class TrendNewscard extends StatelessWidget {
  final News news;

  const TrendNewscard({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfig.blockSizeVertical * 30,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                color: Colors.black54,
                offset: Offset(0, .75),
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0)),
              child: Image.network(news.image,
                  fit: BoxFit.fill, height: 150, width: double.infinity),
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  news.title,
                  style: TextStyle(color: textcolor),
                ),
              ),
            )
          ],
        ));
  }
}
