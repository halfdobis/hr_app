import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class New extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewState();
  }
}

class NewState extends State<New> {
  String _address;
  String _email;
  String _phoneNumber;
  // DateTime _date;
  // String _forSelf;
  // String _forOnBehalf;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildAddress() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Contact address',
        labelStyle: TextStyle(fontSize: 16),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Address is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _address = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Contact Email',
        labelStyle: TextStyle(fontSize: 16),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Contact phone number',
        labelStyle: TextStyle(fontSize: 16),
      ),
      keyboardType: TextInputType.phone,
      maxLength: 11,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _phoneNumber = value;
      },
    );
  }

  int leaveValue;
  int payValue;
  int officerValue;

  Widget _buildLeaveType() {
    return DropdownButtonFormField(
      value: leaveValue,
      onChanged: (value) {
        setState(() {
          leaveValue = value;
        });
      },
      hint: Text(
        'Leave Type',
        style: TextStyle(fontSize: 16),
      ),
      items: [
        DropdownMenuItem(
          child: Text('Casual Leave'),
          value: 0,
        ),
        DropdownMenuItem(
          child: Text('Sick Leave'),
          value: 1,
        ),
        DropdownMenuItem(
          child: Text('Annual Leave'),
          value: 2,
        ),
        DropdownMenuItem(
          child: Text('Maternity Leave'),
          value: 3,
        )
      ],
    );
  }

  Widget _buildPay() {
    return DropdownButtonFormField(
      value: payValue,
      onChanged: (value) {
        setState(() {
          payValue = value;
        });
      },
      hint: Text(
        'Pay LTG',
        style: TextStyle(fontSize: 16),
      ),
      items: [
        DropdownMenuItem(
          child: Text('Yes'),
          value: 0,
        ),
        DropdownMenuItem(
          child: Text('No'),
          value: 1,
        ),
      ],
    );
  }

  Widget _buildOfficer() {
    return DropdownButtonFormField(
      value: officerValue,
      onChanged: (value) {
        setState(() {
          officerValue = value;
        });
      },
      hint: Text(
        'Deputizing Officer',
        style: TextStyle(fontSize: 16),
      ),
      items: [
        DropdownMenuItem(
          child: Text('Mariam'),
          value: 0,
        ),
        DropdownMenuItem(
          child: Text('Olu'),
          value: 1,
        ),
        DropdownMenuItem(
          child: Text('Nathaniel'),
          value: 2,
        ),
      ],
    );
  }

  dynamic radioValue;
  radioValueChange(value) {
    setState(() {
      radioValue = value;
    });
  }

  Widget _buildRadioButton(value, text) {
    return FlatButton(
      onPressed: () {
        setState(() {
          radioValue = value;
        });
      },
      child: Row(
        children: [
          Radio(
            onChanged: radioValueChange,
            value: value,
            groupValue: radioValue,
          ),
          Text(text),
        ],
      ),
    );
  }

  Widget _buildRadioGroup() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildRadioButton(1, 'For Self'),
        _buildRadioButton(2, 'On-Behalf')
      ],
    );
  }

  Widget _buildStartDate() {
    return DateTimeFormField(
      mode: DateTimeFieldPickerMode.date,
      decoration: InputDecoration(
          hintText: 'Start Date',
          hintStyle: TextStyle(fontSize: 16, color: Colors.black54),
          suffixIcon: Icon(Icons.calendar_today_rounded)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
  }

  Widget _buildEndDate() {
    var now = DateTime.now();
    return DateTimeFormField(
      mode: DateTimeFieldPickerMode.date,
      decoration: InputDecoration(
          hintText: 'End Date',
          hintStyle: TextStyle(fontSize: 16, color: Colors.black54),
          suffixIcon: Icon(Icons.calendar_today_rounded)),
      firstDate: now,
      lastDate: now.add(Duration(days: 3 * 31)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context)
          .copyWith(textTheme: GoogleFonts.montserratTextTheme()),
      child: Builder(
        builder: (context) => Scaffold(
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(
                              height: 40.0,
                            ),
                            Text(
                              'Who are you making this request for?',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                            _buildRadioGroup(),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(24, 20, 24, 30),
                      child: Column(
                        children: <Widget>[
                          _buildLeaveType(),
                          SizedBox(
                            height: 25,
                          ),
                          _buildPay(),
                          SizedBox(
                            height: 25,
                          ),
                          _buildStartDate(),
                          SizedBox(
                            height: 25,
                          ),
                          _buildEndDate(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(24, 20, 24, 30),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Select Deputizing Officer',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          _buildOfficer(),
                          SizedBox(
                            height: 25,
                          ),
                          _buildEmail(),
                          SizedBox(
                            height: 25,
                          ),
                          _buildAddress(),
                          SizedBox(
                            height: 25,
                          ),
                          _buildPhoneNumber(),
                        ],
                      ),
                    ),
                    SizedBox(height: 40.0),
                    SizedBox(
                      height: 45.0,
                      child: RaisedButton(
                        color: Colors.green[700],
                        child: Text(
                          'Initiate Leave Request',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        onPressed: () {
                          if (!_formKey.currentState.validate()) {
                            return;
                          }

                          _formKey.currentState.save();

                          print(_address);
                          print(_email);
                          print(_phoneNumber);

                          //Send to API
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
