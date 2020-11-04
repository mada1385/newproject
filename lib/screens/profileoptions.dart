import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gulf_football/components/profileoptioncard.dart';
import 'package:gulf_football/components/texts.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/screens/profilescreen.dart';
import 'package:image_picker/image_picker.dart';

class Profileoptions extends StatefulWidget {
  @override
  _ProfileoptionsState createState() => _ProfileoptionsState();
}

class _ProfileoptionsState extends State<Profileoptions> {
  File _image;
  bool isSwitched = false;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      print('Image Path $_image');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Container(
            child: ListView(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2,
                        offset: Offset(0, .75))
                  ], color: Colors.white),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await getImage();
                        },
                        child: Column(
                          children: [
                            CircleAvatar(
                                maxRadius: 50,
                                backgroundImage: _image != null
                                    ? FileImage(_image)
                                    : AssetImage(
                                        "asset/nopic.jpg",
                                      )),
                            SizedBox(
                              height: 10,
                            ),
                            Boldaccectcolor(
                              text: "user name ",
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Profileoptioncard(
                      icon: Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                            print(isSwitched);
                          });
                        },
                        activeTrackColor: accentcolor,
                        activeColor: accentcolor,
                      ),
                      title: "contact us",
                    ),
                    Profileoptioncard(
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Profilescreen()));
                      },
                      // icon: Icon(Icons.person),
                      title: "company profile",
                    ),
                    Profileoptioncard(
                      // icon: Icon(Icons.payment),
                      title: "contact us",
                    ),
                    Profileoptioncard(
                      // icon: Icon(Icons.call),
                      title: "terms of service",
                    ),
                    Profileoptioncard(
                      // icon: Icon(Icons.payment),
                      title: "privacy policy",
                    ),
                    Profileoptioncard(
                      // icon: Icon(Icons.payment),
                      title: "share gulf goal",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
