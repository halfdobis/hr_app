import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hr_app/ui/dialogue/leave.dart';
import 'package:hr_app/ui/dialogue/redeploy.dart';
import 'package:hr_app/ui/dialogue/transfer.dart';
import 'package:hr_app/ui/dialogue/travel.dart';
import 'package:hr_app/ui/service_locator.dart';
import 'package:hr_app/services/navigation_service.dart';
import 'package:hr_app/ui/splashscreen.dart';
import './ui/drawer.dart';
import './ui/login.dart';

void main() async {
  setupLocator();
  runApp(MyApp());
}

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.orange,
        textTheme: GoogleFonts.acmeTextTheme(),
      ),
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: (routeSettings) {
        switch (routeSettings.name) {
          case 'login':
            return MaterialPageRoute(builder: (context) => LoginPage());
          case 'home':
            return MaterialPageRoute(builder: (context) => MyNavigationBar());
          case 'leave':
            return MaterialPageRoute(builder: (context) => Leave());
          case 'transfer':
            return MaterialPageRoute(builder: (context) => Transfer());
          case 'redeploy':
            return MaterialPageRoute(builder: (context) => Redeployment());
          case 'travel':
            return MaterialPageRoute(builder: (context) => Travel());
          default:
            return MaterialPageRoute(builder: (context) => SplashScreen());
        }
      },
    );
  }
}
