import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hr_app/model/login_model.dart';
import 'package:hr_app/api/api_service.dart';
import 'package:hr_app/ui/service_locator.dart';
import 'package:hr_app/ui/reset.dart';
import 'package:flushbar/flushbar.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';

class LoginPage extends StatefulWidget {
  static Route<Object> route;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  bool hidePassword = true;
  LoginRequestModel requestModel = LoginRequestModel();

  String defaultPassword = '360HR_me';

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
        labelText: 'Password',
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

  @override
  void initState() {
    super.initState();
    requestModel = new LoginRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.55,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/login1.jpg'),
                        fit: BoxFit.cover)),
                // child: Stack(
                //   children: <Widget>[
                //     Positioned(
                //       left: 150.0,
                //       bottom: 50.0,
                //       child: TyperAnimatedTextKit(
                //         text: ['Login'],
                //         textStyle: TextStyle(
                //             fontWeight: FontWeight.w600,
                //             fontSize: 30.0,
                //             letterSpacing: 1.5,
                //             color: Colors.black87),
                //       ),
                //     )
                //   ],
                // ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/lapo_360.png',
                      width: 200,
                    ),
                    // Text(
                    //   'LAPO HR 360',
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 25.0,
                    //       letterSpacing: 1.5,
                    //       color: Color.fromRGBO(0, 0, 0, .7)),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                child: Form(
                  key: globalFormKey,
                  child: Column(
                    children: <Widget>[
                      _buildName(),
                      _buildPassword(),
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
                                'LOGIN',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 22.0),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            // showDialog(
                            //   context: context,
                            //   builder: (context) => ResetPassword(),
                            // );
                            // return;
                            if (validateAndSave()) {
                              var response = await locator<APIService>()
                                  .login(requestModel);
                              if (response.token != null) {
                                if (requestModel.password == defaultPassword) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => ResetPassword(),
                                  );
                                  return;
                                }
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
                                backgroundColor:
                                    Color(0xffe34f4f).withOpacity(0.8),
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
              )
            ],
          ),
        ));
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
