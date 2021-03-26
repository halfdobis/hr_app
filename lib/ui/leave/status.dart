import 'package:flutter/material.dart';

class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50.0,
            ),
            Card(
              color: Color.fromRGBO(255, 255, 255, .8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              borderOnForeground: true,
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      '20 Days',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.green[900]),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Total Annual Leave Days',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 1.0,
            ),
            Card(
              color: Color.fromRGBO(255, 255, 255, .8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              borderOnForeground: true,
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      '0 Days',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.green[900]),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Used Leave Days',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 1.0,
            ),
            Card(
              color: Color.fromRGBO(255, 255, 255, .8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              borderOnForeground: true,
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Days',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.green[900]),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Remaining Leave Days',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
