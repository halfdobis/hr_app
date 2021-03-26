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
                      '0 Transfers',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.green[900]),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Total number of transfers',
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
          ],
        ),
      ),
    );
  }
}
