import 'package:calendar_strip/calendar_strip.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gulf_football/components/fixturelist.dart';
import 'package:gulf_football/components/team_list.dart';
import 'package:gulf_football/config/mediaqueryconfig.dart';
import 'package:gulf_football/screens/leaugefixturescreen.dart';
import 'package:gulf_football/screens/standingsscreen.dart';
import 'package:gulf_football/services/footballapi.dart';
import 'package:gulf_football/services/standingsAPI.dart';

class Gamescreen extends StatefulWidget {
  @override
  _GamescreenState createState() => _GamescreenState();
}

class _GamescreenState extends State<Gamescreen> {
  int leaguetab = 0;
  int curentTab = 0;
  int selectedIndex = 0;
  int leaugeidtab = 0;
  List<String> league = [
    "★  favourits",
    "all games",
    "Premiere League",
    "Bundesliga",
    "Serie A",
    "La Liga"
  ];

  DateTime startDate = DateTime.now().subtract(Duration(days: 1000));
  DateTime endDate = DateTime.now().add(Duration(days: 1000));
  DateTime selectedDate = DateTime.now().subtract(Duration(days: 0));
  // List<DateTime> markedDates = [
  //   DateTime.now().subtract(Duration(days: 1)),
  //   DateTime.now().subtract(Duration(days: 1)),
  //   DateTime.now().add(Duration(days: 365))
  // ];

  @override
  void initState() {
    super.initState();
  }

  onSelect(data) {
    selectedDate = data;
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
      // _children.add(getMarkedIndicatorWidget());
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
    List<String> leagueid = [null, null, "148", "195", "262", "468"];

    List<Widget> leaugedetails = [
      FutureBuilder(
        future: SoccerApi().getAllMatches(
            leagueid[leaugeidtab]), //Here we will call our getData() method,
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
      // FutureBuilder(
      //   future: StandiingAPI(leagueid[leaugeidtab])
      //       .getTable(), //Here we will call our getData() method,
      //   builder: (context, snapshot) {
      //     //the future builder is very intersting to use when you work with api
      //     if (snapshot.hasData) {
      //       print((snapshot.data).length);
      //       return Standingscreen(
      //         data: snapshot.data,
      //       );
      //     } else {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //   }, // here we will buil the app layout
      // ),
    ];
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xffF7F8FA),
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 15.0,
                        offset: Offset(0.0, .75))
                  ], color: Colors.white),
                  height: SizeConfig.safeBlockVertical * 14,
                  child: Padding(
                    padding: EdgeInsets.all(2),
                    child: CalendarStrip(
                      startDate: startDate,
                      endDate: endDate,
                      selectedDate: selectedDate,
                      onDateSelected: onSelect,
                      onWeekSelected: onWeekSelect,
                      dateTileBuilder: dateTileBuilder,
                      iconColor: Colors.black,
                      monthNameWidget: _monthNameWidget,
                      // markedDates: markedDates,
                      containerDecoration: BoxDecoration(color: Colors.white),
                      addSwipeGesture: true,
                    ),
                  )),
              SizedBox(
                height: 2,
              ),
              Container(
                color: Color(0xffFCFCFC),

                height: SizeConfig.blockSizeVertical * 6,
                //color: Theme.of(context).primaryColor,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: league.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            // if (index == 0 || index == 1) {
                            //   leaugeidtab = 2;
                            // } else
                            leaugeidtab = index;
                            selectedIndex = index;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Container(
                            width: 110,
                            // padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              color: selectedIndex == index
                                  ? Colors.green
                                  : Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Text(
                                  league[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 1.9,
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
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.blockSizeHorizontal * 1),
                          child: Column(
                            children: <Widget>[
                              Container(
                                color: Color(0xffFCFCFC),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              leaguetab = 0;
                                            });
                                          },
                                          child: Column(
                                            children: [
                                              Text(
                                                "fixture",
                                                style: TextStyle(
                                                  fontSize: 25,
                                                  color: leaguetab == 0
                                                      ? Colors.green
                                                      : Colors.grey,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                color: leaguetab == 0
                                                    ? Colors.green
                                                    : Colors.transparent,
                                                height: 4,
                                              )
                                            ],
                                          )),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.blockSizeVertical * 4,
                                      child: Container(
                                        width: 1,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Expanded(
                                      child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              leaguetab = 1;
                                            });
                                          },
                                          child: Column(
                                            children: [
                                              Text(
                                                "standings",
                                                style: TextStyle(
                                                  fontSize: 25,
                                                  color: leaguetab == 1
                                                      ? Colors.green
                                                      : Colors.grey,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                color: leaguetab == 1
                                                    ? Colors.green
                                                    : Colors.transparent,
                                                height: 4,
                                              )
                                            ],
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Standingscreen(),

                        // TeamList(idLeague),
                      ),
                      leaugedetails[leaguetab],
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
