import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hr_app/ui/dialogue/modal.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:sample_app/ui/service_locator.dart';
// import 'package:sample_app/services/navigation_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var items = [
    Image.asset(
      'assets/images/img2.jpg',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'assets/images/img3.jpg',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'assets/images/img4.jpg',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'assets/images/img5.jpg',
      fit: BoxFit.fill,
    )
  ];

  @override
  Widget build(BuildContext context) {
    RequestModal requestModal = RequestModal();
    // to get size

    // style
    var cardTextStyle =
        TextStyle(fontSize: 16, color: Color.fromRGBO(63, 63, 63, 1));

    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: Text('Are you sure you want to exit this app?'),
                  actions: [
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: Text(
                          'Yes',
                          style: TextStyle(color: Colors.orange[700]),
                        )),
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'No',
                          style: TextStyle(color: Colors.orange[700]),
                        ))
                  ],
                ));
      },
      child: SingleChildScrollView(
        padding: EdgeInsets.all(5.0),
        child: Container(
          child: Column(
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                borderOnForeground: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: GridView.count(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        mainAxisSpacing: 3,
                        primary: false,
                        crossAxisCount: 3,
                        children: <Widget>[
                          Container(
                            child: InkWell(
                              splashColor: Colors.orangeAccent,
                              onTap: () => {
                                showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(15))),
                                    context: context,
                                    builder: (context) => Container(
                                          height: 270,
                                          child: requestModal
                                              .modalContainer(context),
                                        )),
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    child: Icon(
                                      Icons.app_registration,
                                      size: 35,
                                    ),
                                    height: 25,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Requests',
                                    style: cardTextStyle,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: InkWell(
                              splashColor: Colors.orangeAccent,
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    child: Icon(
                                      Icons.person,
                                      size: 35,
                                    ),
                                    height: 25,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'My Biodata',
                                    style: cardTextStyle,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: InkWell(
                              splashColor: Colors.orangeAccent,
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    child: Icon(
                                      Icons.monitor,
                                      size: 35,
                                    ),
                                    height: 25,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Training',
                                    style: cardTextStyle,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: InkWell(
                              splashColor: Colors.orangeAccent,
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    child: Icon(
                                      Icons.card_travel,
                                      size: 35,
                                    ),
                                    height: 25,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Official Travel',
                                    style: cardTextStyle,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: InkWell(
                              splashColor: Colors.orangeAccent,
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    child: Icon(
                                      Icons.copy,
                                      size: 35,
                                    ),
                                    height: 25,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Pay Slip',
                                    style: cardTextStyle,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: InkWell(
                              splashColor: Colors.orangeAccent,
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    child: Icon(
                                      Icons.message,
                                      size: 35,
                                    ),
                                    height: 25,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Messages',
                                    style: cardTextStyle,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 340.0,
                child: CarouselSlider(
                    items: items,
                    options: CarouselOptions(
                      aspectRatio: 16 / 9,
                      viewportFraction: 1.0,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      disableCenter: true,
                    )),
              ),
              SizedBox(
                height: 400,
              )
            ],
          ),
        ),
      ),
    );
  }
}
