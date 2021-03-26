import 'dart:ui';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:hr_app/api/api_service.dart';
import 'package:hr_app/ui/service_locator.dart';
import 'package:hr_app/model/reset_model.dart';

class ResetPassword extends StatefulWidget {
  static Route<Object> route;

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  bool hidePassword = true;
  ResetRequestModel requestModel = ResetRequestModel();
  Widget _buildName() {
    return TextFormField(
      textCapitalization: TextCapitalization.characters,
      decoration: InputDecoration(
          labelText: 'Username',
          labelStyle: TextStyle(fontSize: 20),
          prefixIcon: Icon(
            Icons.person,
            color: Colors.grey[700],
          )),
      maxLength: 7,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Username is Required';
        }

        return null;
      },
      onSaved: (input) => requestModel.name = input,
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      obscureText: hidePassword,
      decoration: InputDecoration(
        labelText: 'Old Password',
        labelStyle: TextStyle(fontSize: 20),
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.grey[700],
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              hidePassword = !hidePassword;
            });
          },
          color: Colors.grey[700],
          icon: Icon(hidePassword ? Icons.visibility_off : Icons.visibility),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }

        return null;
      },
      onSaved: (input) => requestModel.password = input,
    );
  }

  Widget _buildNewPassword() {
    return TextFormField(
      obscureText: hidePassword,
      decoration: InputDecoration(
        labelText: 'New Password',
        labelStyle: TextStyle(fontSize: 20),
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.grey[700],
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              hidePassword = !hidePassword;
            });
          },
          color: Colors.grey[700],
          icon: Icon(hidePassword ? Icons.visibility_off : Icons.visibility),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'New Password is Required';
        }

        return null;
      },
      onSaved: (input) => requestModel.newpassword = input,
    );
  }

  Widget _buildConfirmPassword() {
    return TextFormField(
      obscureText: hidePassword,
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        labelStyle: TextStyle(fontSize: 20),
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.grey[700],
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              hidePassword = !hidePassword;
            });
          },
          color: Colors.grey[700],
          icon: Icon(hidePassword ? Icons.visibility_off : Icons.visibility),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Confirm your password';
        }

        return null;
      },
      onSaved: (input) => requestModel.confirmpassword = input,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        margin: EdgeInsets.all(25.0),
        child: Material(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: globalFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Password Reset',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.green[700]),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  _buildName(),
                  _buildPassword(),
                  _buildNewPassword(),
                  _buildConfirmPassword(),
                  SizedBox(
                    height: 50.0,
                  ),
                  FlatButton(
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                            color: Color(0xffff6600),
                            borderRadius: BorderRadius.circular(50.0)),
                        child: Center(
                          child: Text(
                            'RESET',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 22.0),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        if (validateAndSave()) {
                          var response =
                              await locator<APIService>().reset(requestModel);
                          if (response.token != null) {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                'home', (route) => false);
                            return;
                          }
                          Flushbar(
                            messageText: Center(
                              child: Text(
                                response.error,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            backgroundColor: Color(0xffe34f4f).withOpacity(0.8),
                            flushbarPosition: FlushbarPosition.TOP,
                            flushbarStyle: FlushbarStyle.FLOATING,
                            duration: Duration(milliseconds: 3000),
                            margin: EdgeInsets.symmetric(horizontal: 25.0),
                            barBlur: 6.0,
                          ).show(context);
                        }
                      }

                      //Send to API
                      ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
