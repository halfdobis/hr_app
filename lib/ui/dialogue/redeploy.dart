import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hr_app/ui/redeploy/history.dart';
import 'package:hr_app/ui/redeploy/new.dart';
import 'package:hr_app/ui/redeploy/status.dart';

class Redeployment extends StatefulWidget {
  static Route<Object> route;

  Redeployment({Key key}) : super(key: key);

  @override
  _RedeploymentState createState() => _RedeploymentState();
}

class _RedeploymentState extends State<Redeployment> {
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
              'Redeployment',
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
