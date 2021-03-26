import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hr_app/ui/travel/history.dart';
import 'package:hr_app/ui/travel/new.dart';
import 'package:hr_app/ui/travel/status.dart';

class Travel extends StatefulWidget {
  static Route<Object> route;

  Travel({Key key}) : super(key: key);

  @override
  _TravelState createState() => _TravelState();
}

class _TravelState extends State<Travel> {
  static List<Widget> _content = <Widget>[
    New(),
    Status(),
    History(),
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            brightness: Brightness.light,
            iconTheme: IconThemeData(color: Colors.black),
            title: const Text(
              'Travel Expense Request',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.w900),
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
            bottom: TabBar(
              labelColor: Colors.green[900],
              unselectedLabelColor: Colors.black,
              labelStyle: TextStyle(fontSize: 18.0),
              indicatorColor: Colors.green[900],
              indicatorWeight: 4.0,
              tabs: <Widget>[
                Tab(
                    child: Container(
                  child: Text(
                    'New',
                  ),
                )),
                Tab(
                    child: Container(
                  child: Text(
                    'Status',
                  ),
                )),
                Tab(
                    child: Container(
                  child: Text(
                    'History',
                  ),
                )),
              ],
            )),
        body: TabBarView(
          children: _content,
        ),
      ),
    );
  }
}
