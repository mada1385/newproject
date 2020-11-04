import 'package:flutter/material.dart';
import 'package:gulf_football/components/countrylist.dart';
import 'package:gulf_football/components/texts.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/config/mediaqueryconfig.dart';
import 'package:gulf_football/models/country.dart';
import 'package:gulf_football/services/countryAPI.dart';

class Countrylistscreen extends StatefulWidget {
  @override
  _CountrylistscreenState createState() => _CountrylistscreenState();
}

class _CountrylistscreenState extends State<Countrylistscreen> {
  // List<Country> countries = [
  //   Country("egypt", "id"),
  //   Country("egypt", "id"),
  //   Country("egypt", "id"),
  //   Country("egypt", "id"),
  //   Country("egypt", "id"),
  //   Country("egypt", "id"),
  //   Country("egypt", "id"),
  // ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SizedBox.expand(
          child: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: SizeConfig.blockSizeVertical * 25,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Boldaccectcolor(
                            text: "Choose your country",
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: IconButton(
                              icon: Icon(Icons.search),
                              onPressed: () {},
                              color: accentcolor,
                              iconSize: 30,
                            ))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Contenttext(
                        data: "select your country",
                        size: 15,
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 2,
                        offset: Offset(0, 0.75)),
                  ],
                  color: Color(0xffF2FBF9),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: CountryApi()
                    .getAllCountries(), //Here we will call our getData() method,
                builder: (context, snapshot) {
                  //the future builder is very intersting to use when you work with api
                  if (snapshot.hasData) {
                    print((snapshot.data).length);
                    return Countrylist(
                      countries: snapshot.data,
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }, // here we will buil the app layout
              ),
            ],
          ),
        ),
      )),
    );
  }
}
