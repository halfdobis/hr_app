import 'package:flutter/material.dart';

class RequestModal {
  Container modalContainer(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      )),
      child: ListView(
        children: <Widget>[
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () => {Navigator.pop(context)},
                  child: Icon(
                    Icons.clear,
                    color: Colors.black,
                    size: 25.0,
                  ),
                ),
                Text(
                  'Select Request',
                  style: TextStyle(fontSize: 20),
                ),
                Text('')
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(8, 0, 5, 0),
                height: 50.0,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade200))),
                child: InkWell(
                  splashColor: Colors.orangeAccent,
                  onTap: () =>
                      {Navigator.of(context).pushReplacementNamed('leave')},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Leave Requests',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 10,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(8, 0, 5, 0),
                height: 40.0,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade200))),
                child: InkWell(
                  splashColor: Colors.orangeAccent,
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('transfer');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Transfer Requests',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 10,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(8, 0, 5, 0),
                height: 40.0,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade200))),
                child: InkWell(
                  splashColor: Colors.orangeAccent,
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('redeploy');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Redeployment',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 10,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(8, 0, 5, 0),
                height: 40.0,
                child: InkWell(
                  splashColor: Colors.orangeAccent,
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('travel');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Travel Expense Requests',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 10,
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
