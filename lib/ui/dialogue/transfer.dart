import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hr_app/ui/transfer/history.dart';
import 'package:hr_app/ui/transfer/new.dart';
import 'package:hr_app/ui/transfer/status.dart';

class Transfer extends StatefulWidget {
  static Route<Object> route;

  Transfer({Key key}) : super(key: key);

  @override
  _TransferState createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
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
              'Transfer Request',
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
