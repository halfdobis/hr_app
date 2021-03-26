import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hr_app/ui/leave/history.dart';
import 'package:hr_app/ui/leave/new.dart';
import 'package:hr_app/ui/leave/status.dart';

class Leave extends StatefulWidget {
  static Route<Object> route;

  Leave({Key key}) : super(key: key);

  @override
  _LeaveState createState() => _LeaveState();
}

class _LeaveState extends State<Leave> {
  static List<Widget> _content = <Widget>[
    New(),
    Status(),
    History(),
  ];

  // void _onItemTap(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

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
            textTheme: GoogleFonts.acmeTextTheme(),
            iconTheme: IconThemeData(color: Colors.black),
            title: const Text(
              'Leave Request',
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
              labelStyle:
                  TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
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
