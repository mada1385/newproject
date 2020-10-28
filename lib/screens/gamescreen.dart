import 'package:calendar_strip/calendar_strip.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gulf_football/components/fixturelist.dart';
import 'package:gulf_football/components/team_list.dart';
import 'package:gulf_football/config/mediaqueryconfig.dart';
import 'package:gulf_football/models/footballapi.dart';

class Gamescreen extends StatefulWidget {
  @override
  _GamescreenState createState() => _GamescreenState();
}

class _GamescreenState extends State<Gamescreen> {
  int curentTab = 0;
  int selectedIndex = 0;
  String idLeague = "4328";

  List<IconData> icons = [
    FontAwesomeIcons.iceCream,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.plane,
    FontAwesomeIcons.mugHot
  ];

  List<String> league = [
    "all",
    "favourits",
    "Premiere League",
    "Bundesliga",
    "Serie A",
    "La Liga"
  ];

  DateTime startDate = DateTime.now().subtract(Duration(days: 2));
  DateTime endDate = DateTime.now().add(Duration(days: 2));
  DateTime selectedDate = DateTime.now().subtract(Duration(days: 0));
  List<DateTime> markedDates = [
    DateTime.now().subtract(Duration(days: 1)),
    DateTime.now().subtract(Duration(days: 2)),
    DateTime.now().add(Duration(days: 4))
  ];

  @override
  void initState() {
    super.initState();
  }

  onSelect(data) {
    print("Selected Date -> $data");
  }

  onWeekSelect(data) {
    print("Selected week starting at -> $data");
  }

  _monthNameWidget(monthName) {
    return Container(
      child: Text(
        monthName,
        style: TextStyle(
          fontSize: SizeConfig.blockSizeVertical * 2,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontStyle: FontStyle.italic,
        ),
      ),
      padding: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical * 1,
          bottom: SizeConfig.safeBlockVertical * .5),
    );
  }

  getMarkedIndicatorWidget() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        margin: EdgeInsets.only(left: 1, right: 1),
        width: SizeConfig.blockSizeHorizontal * 1,
        height: SizeConfig.blockSizeVertical * 1,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
      ),
      Container(
        width: SizeConfig.blockSizeHorizontal * 1,
        height: SizeConfig.blockSizeVertical * 1,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
      )
    ]);
  }

  dateTileBuilder(
      date, selectedDate, rowIndex, dayName, isDateMarked, isDateOutOfRange) {
    bool isSelectedDate = date.compareTo(selectedDate) == 0;
    Color fontColor = isDateOutOfRange ? Colors.black26 : Colors.black87;
    TextStyle normalStyle = TextStyle(
        fontSize: SizeConfig.blockSizeVertical * 2,
        fontWeight: FontWeight.w800,
        color: fontColor);
    TextStyle selectedStyle = TextStyle(
        fontSize: SizeConfig.blockSizeVertical * 2,
        fontWeight: FontWeight.w800,
        color: Colors.black87);
    TextStyle dayNameStyle =
        TextStyle(fontSize: SizeConfig.blockSizeVertical * 2, color: fontColor);
    List<Widget> _children = [
      Text(dayName, style: dayNameStyle),
      Text(date.day.toString(),
          style: !isSelectedDate ? normalStyle : selectedStyle),
    ];

    if (isDateMarked == true) {
      _children.add(getMarkedIndicatorWidget());
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      alignment: Alignment.center,
      padding: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical * 1,
          left: SizeConfig.blockSizeHorizontal * .5,
          right: SizeConfig.blockSizeHorizontal * .5,
          bottom: SizeConfig.blockSizeVertical * .5),
      decoration: BoxDecoration(
        color: !isSelectedDate ? Colors.transparent : Colors.green,
        borderRadius: BorderRadius.all(Radius.circular(60)),
      ),
      child: Column(
        children: _children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    SizeConfig().init(context);
    DateTime selecteddate;
    return Scaffold(
      // appBar: ,
      body: SafeArea(
        child: Column(
          children: [
            Container(
                height: SizeConfig.safeBlockVertical * 14,
                child: CalendarStrip(
                  startDate: startDate,
                  endDate: endDate,
                  selectedDate: selectedDate,
                  onDateSelected: onSelect,
                  onWeekSelected: onWeekSelect,
                  dateTileBuilder: dateTileBuilder,
                  iconColor: Colors.black,
                  monthNameWidget: _monthNameWidget,
                  markedDates: markedDates,
                  containerDecoration: BoxDecoration(color: Colors.black12),
                  addSwipeGesture: true,
                )),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      // SizedBox(height: 8.0),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockSizeHorizontal * 1),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: SizeConfig.blockSizeVertical * 6,
                              //color: Theme.of(context).primaryColor,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: league.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = index;
                                          if (index == 0) {
                                            idLeague = "4328";
                                          } else if (index == 1) {
                                            idLeague = "4331";
                                          } else if (index == 2) {
                                            idLeague = "4332";
                                          } else {
                                            idLeague = "4335";
                                          }
                                        });
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Container(
                                          width: 110,
                                          // padding: EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            color: selectedIndex == index
                                                ? Colors.green
                                                : Color(0xFFFFFFFF),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.all(3),
                                              child: Text(
                                                league[index],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: SizeConfig
                                                          .blockSizeVertical *
                                                      1.5,
                                                  fontWeight: FontWeight.w500,
                                                  color: selectedIndex == index
                                                      ? Colors.white
                                                      : Color(0xFFB4C1C4),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),

                            //listLeague(0)
                          ],
                        ),
                      ),
                      FutureBuilder(
                        future: SoccerApi()
                            .getAllMatches(), //Here we will call our getData() method,
                        builder: (context, snapshot) {
                          //the future builder is very intersting to use when you work with api
                          if (snapshot.hasData) {
                            print((snapshot.data).length);
                            return Fixturelist(
                              allmatches: snapshot.data,
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }, // here we will buil the app layout
                      ),
                      // TeamList(idLeague),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
