import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heritageFitness/util/constants.dart';

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: 
              NeumorphicBackground(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 30,),
                        NeumorphicText(
                          'Athlean Fitness',
                          style: NeumorphicStyle(
                            color: Colors.black
                          ),
                          textStyle: NeumorphicTextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        NeumorphicText(
                          'Hello Arun!',
                          style: NeumorphicStyle(
                            color: Colors.black
                          ),
                          textStyle: NeumorphicTextStyle(
                            fontSize: 15.0,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                        SizedBox(height: 15.0,),
                        _bigboard(),
                        SizedBox(height: 30.0,),
                        _buildRow1(context),
                        SizedBox(height: 30.0,),
                        _buildRow2(context),
                        SizedBox(height: 70.0,),
                        Text(
                          'Clients nearing deadline',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontFamily: 'OpenSans',
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              )
        ),
      ),
    );
  }

  Widget _bigboard(){
    return Neumorphic(
      style: NeumorphicStyle(
        color: Colors.blueAccent,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        height: 180,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: NeumorphicText(
                          "Monday",
                          textAlign: TextAlign.start,
                          style: NeumorphicStyle(
                            color: Colors.white,
                            shadowLightColor: Colors.blueAccent
                          ),
                          textStyle: NeumorphicTextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        child: NeumorphicText(
                          "18 Jan 2021",
                          textAlign: TextAlign.start,
                          style: NeumorphicStyle(
                            color: Colors.white,
                            shadowLightColor: Colors.blueAccent
                          ),
                          textStyle: NeumorphicTextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(top: 20,child: Text(""),)
                ],
              ),
            ),
            SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    NeumorphicText(
                      "3",
                      textAlign: TextAlign.start,
                      style: NeumorphicStyle(
                        color: Colors.white,
                      shadowLightColor: Colors.blueAccent
                      ),
                      textStyle: NeumorphicTextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    NeumorphicText(
                      "Trainers",
                      textAlign: TextAlign.start,
                      style: NeumorphicStyle(
                        color: Colors.white,
                      shadowLightColor: Colors.blueAccent
                      ),
                      textStyle: NeumorphicTextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    NeumorphicText(
                      "25",
                      textAlign: TextAlign.start,
                      style: NeumorphicStyle(
                        color: Colors.white,
                        shadowLightColor: Colors.blueAccent
                      ),
                      textStyle: NeumorphicTextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    NeumorphicText(
                      "Clients",
                      textAlign: TextAlign.start,
                      style: NeumorphicStyle(
                        color: Colors.white,
                        shadowLightColor: Colors.blueAccent
                      ),
                      textStyle: NeumorphicTextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRow1(context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Neumorphic(
          child: Container(
            height: 140.0,
            width: MediaQuery.of(context).size.width/2 - 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.userCog,
                  size: 50,color: Colors.blueAccent,
                ),
                SizedBox(height: 15,),
                Text(
                  'Clients',
                  style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontFamily: 'OpenSans',
                              ),
                ),
              ],
            ),
          ),
        ),
        Neumorphic(
          child: Container(
            height: 140.0,
            width: MediaQuery.of(context).size.width/2 - 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.running,
                  size: 50,color: Colors.blueAccent
                ),
                SizedBox(height: 15,),
                Text(
                  'Trainers',
                  style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontFamily: 'OpenSans',
                              ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildRow2(context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Neumorphic(
          child: Container(
            height: 140.0,
            width: MediaQuery.of(context).size.width/2 - 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.dollarSign,
                  size: 50,color: Colors.blueAccent,
                ),
                SizedBox(height: 15,),
                Text(
                  'Finance',
                  style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontFamily: 'OpenSans',
                              ),
                ),
              ],
            ),
          ),
        ),
        Neumorphic(
          child: Container(
            height: 140.0,
            width: MediaQuery.of(context).size.width/2 - 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.joget,
                  size: 50,color: Colors.blueAccent
                ),
                SizedBox(height: 15,),
                Text(
                  'Equipment',
                  style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontFamily: 'OpenSans',
                              ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }


  Neumorphic _buildCard(String value) {
    return Neumorphic(
      style: NeumorphicStyle(
        // depth: 9
      ),
      child: Container(
        height: 300,
        width: double.infinity,
        child: Icon(FontAwesomeIcons.appStore,size: 80,color: Colors.blueAccent,),
      ),
    );
  }
}

// Container(
//                 height: double.infinity,
//                 child: SingleChildScrollView(
//                   physics: AlwaysScrollableScrollPhysics(),
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 30.0,
//                     vertical: 120.0,
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Text(
//                         'Dashboard',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontFamily: 'OpenSans',
//                           fontSize: 30.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 80.0),
//                       Container(
//                         width: double.infinity,
//                         child: Column(
//                           children: [
//                             Neumorphic(
//                               style: NeumorphicStyle(
//                                   shadowLightColor: Color(0xFF73AEF1),
//                                   depth: 2,
//                                   lightSource: LightSource.topLeft),
//                               child: Container(
//                                 height: 100,
//                                 width: double.maxFinite,
//                                 decoration: BoxDecoration(
//                                   color: Color(0xFF61A4F1),
//                                 ),
//                                 child: Align(
//                                   alignment: Alignment(-0.8, 0),
//                                   child: Text(
//                                     'Income',
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontFamily: 'OpenSans',
//                                         fontSize: 24.0,
//                                         fontWeight: FontWeight.bold,
//                                         // decoration: TextDecoration.underline,
//                                         decorationColor: Color(0xFFEC8026)
//                                       ),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 40,),
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 _buildCard('Members'),
//                                 _buildCard('Trainers'),
//                               ],
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               )
