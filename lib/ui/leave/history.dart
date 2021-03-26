import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context)
          .copyWith(textTheme: GoogleFonts.montserratTextTheme()),
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 25.0),
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Today',
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.green[900]),
                ),
              ),
              Column(
                children: <Widget>[
                  CustomHistoryTile(
                    title: 'Annual Leave (1st half)',
                    subtitle: '04:00 PM',
                    status: RequestStatus.Approved,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  CustomHistoryTile(
                    title: 'Casual Leave ',
                    subtitle: '02:58 PM',
                    status: RequestStatus.Pending,
                  ),
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Yesterday',
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.green[900]),
                ),
              ),
              Column(
                children: <Widget>[
                  CustomHistoryTile(
                    title: 'Sick Leave',
                    subtitle: '12:58 PM',
                    status: RequestStatus.Denied,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class CustomHistoryTile extends StatelessWidget {
  final RequestStatus status;
  final String title;
  final String subtitle;

  CustomHistoryTile({Key key, this.status, this.title, this.subtitle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 16.0),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 15.0),
      ),
      trailing: Text(
        statusText[status],
        style: TextStyle(color: statusColors[status], fontSize: 16.0),
      ),
    );
  }

  final Map statusColors = {
    RequestStatus.Approved: Colors.green[600],
    RequestStatus.Pending: Colors.yellow[800],
    RequestStatus.Denied: Colors.red[600],
  };

  final Map statusText = {
    RequestStatus.Approved: 'Approved',
    RequestStatus.Pending: 'Pending',
    RequestStatus.Denied: 'Denied',
  };
}

enum RequestStatus { Approved, Pending, Denied }
