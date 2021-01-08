import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:heritageFitness/util/constants.dart';

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF61A4F1),
                  // gradient: LinearGradient(
                  //   begin: Alignment.topCenter,
                  //   end: Alignment.bottomCenter,
                  //   colors: [
                  //     Color(0xFF73AEF5),
                  //     Color(0xFF61A4F1),
                  //     Color(0xFF478DE0),
                  //     Color(0xFF398AE5),
                  //   ],
                  //   stops: [0.1, 0.4, 0.7, 0.9],
                  // ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Dashboard',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 80.0),
                      Container(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Neumorphic(
                              style: NeumorphicStyle(
                                  shadowLightColor: Color(0xFF73AEF1),
                                  depth: 2,
                                  lightSource: LightSource.topLeft),
                              child: Container(
                                height: 100,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: Color(0xFF61A4F1),
                                ),
                                child: Align(
                                  alignment: Alignment(-0.8, 0),
                                  child: Text(
                                    'Income',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'OpenSans',
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold,
                                        // decoration: TextDecoration.underline,
                                        decorationColor: Color(0xFFEC8026)
                                      ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 40,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildCard('Members'),
                                _buildCard('Trainers'),
                              ],
                            ),
                          ],
                        ),
                      )
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

  Neumorphic _buildCard(String value) {
    return Neumorphic(
      style: NeumorphicStyle(
          shadowLightColor: Color(0xFF73AEF1),
          depth: 2,
          lightSource: LightSource.topLeft),
      child: Container(
        height: 150,
        width: 190,
        decoration: BoxDecoration(
          color: Color(0xFF61A4F1),
        ),
        child: Align(
          alignment: Alignment(-0.4, 0.4),
          child: Text(
            value,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
