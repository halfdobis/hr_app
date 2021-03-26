import 'package:flutter/material.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return ListView(
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
                    fontSize: 18.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.green[900]),
              ),
            ),
            Column(
              children: <Widget>[
                CustomHistoryTile(
                  title: 'Transfer',
                  subtitle: '04:00 PM',
                  status: RequestStatus.Approved,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                CustomHistoryTile(
                  title: 'Transfer',
                  subtitle: '02:58 PM',
                  status: RequestStatus.Denied,
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
                '12 Feb 2020',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.green[900]),
              ),
            ),
            Column(
              children: <Widget>[
                CustomHistoryTile(
                  title: 'Transfer',
                  subtitle: '12:58 PM',
                  status: RequestStatus.Approved,
                ),
              ],
            )
          ],
        )
      ],
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
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Text(
        statusText[status],
        style: TextStyle(color: statusColors[status]),
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
