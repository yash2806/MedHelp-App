import 'package:flutter/material.dart';
import 'package:hackthon_app/Dashboard/mapLocator/mapView.dart';
import 'package:hackthon_app/Dashboard/patientsDetail/medicalRecords.dart';
import 'package:hackthon_app/Dashboard/patientsDetail/patientsDetail.dart';
import 'package:hackthon_app/Dashboard/webBot.dart';
import 'package:hackthon_app/loginPage/SignupPage.dart';
import 'package:hackthon_app/loginPage/loginPage.dart';
import 'package:hackthon_app/loginPage/splash.dart';

import 'package:hackthon_app/profilePage/profile.dart';
import 'package:hackthon_app/startPage.dart';

import 'Dashboard/doctorsDashboard.dart';
import 'Dashboard/patientDashboard.dart';
import 'Dashboard/patientsDetail/viewDetails.dart';
import 'getStarted.dart';
import 'loginPage/doctorsLogin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/startPage': (context) => startPage(),
        '/patientDashboard': (context) => patientDashboardPage(),
        '/mapPage': (context) => mapPage(),
        '/viewDetails': (context) => viewDetails(),
        '/detailsForm': (context) => detailsForm(),
        '/profile': (context) => profilePage(),
        '/records': (context) => medicalRecords(),
        '/splashPage': (context) => SplashPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => SignupPage(),
        '/doctorsLogin': (context) => doctorsLogin(),
        '/doctorsDashboard': (context) => doctorsDashboardPage(),
        '/webBot':(context)=>webBot()
      },
    );
  }
}
