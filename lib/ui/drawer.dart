import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homescreen.dart';

class MyNavigationBar extends StatefulWidget {
  static Route<Object> route;

  MyNavigationBar({Key key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  static List<Widget> _options = <Widget>[
    HomeScreen(),
    Text('This screen is unavailable',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    Text('This screen is unavailable',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    Text('This screen is unavailable',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    Text('This screen is unavailable',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  bool requestExpanded = false;
  void onRequestTap() {
    setState(() {
      requestExpanded = !requestExpanded;
    });
  }

  bool bioDataExpanded = false;
  void onBioDataTap() {
    setState(() {
      bioDataExpanded = !bioDataExpanded;
    });
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        body: Center(
          child: _options.elementAt(_selectedIndex),
        ),
        headerSliverBuilder: (context, _) => [
          SliverAppBar(
            floating: true,
            pinned: true,
            elevation: 10,
            title: Text(
              _ ? 'LAPO 360 HR' : '',
              style: TextStyle(color: Colors.white70),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Hi, Adaobi',
                      style: GoogleFonts.encodeSans(
                          fontSize: 60,
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(255, 255, 255, .5)),
                    ),
                    Text(
                      'SN12345',
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(255, 255, 255, .5)),
                    )
                  ],
                ),
              ),
            ),
            expandedHeight: 250,
            brightness: Brightness.dark,
            leading: IconButton(
              onPressed: () {
                _scaffoldKey.currentState.openDrawer();
              },
              icon: Icon(
                Icons.menu_rounded,
                size: 30,
              ),
              color: Colors.white,
            ),
            backgroundColor: Colors.green[900],
          ),
        ],
      ),
      key: _scaffoldKey,
      drawer: SafeArea(
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20))),
          child: Drawer(
            child: Expanded(
              child: ListView(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Material(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/lapo-logo.png',
                                width: 80,
                                height: 80,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomListStyle(
                    Icons.app_registration,
                    'Requests',
                    onRequestTap,
                  ),
                  if (requestExpanded)
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        children: <Widget>[
                          CustomListStyle(Icons.add_rounded, 'Leave Requests',
                              () {
                            Navigator.of(context).popAndPushNamed('leave');
                          }),
                          CustomListStyle(
                            Icons.add_rounded,
                            'Transfer Requests',
                            () {
                              Navigator.of(context).popAndPushNamed('transfer');
                            },
                          ),
                          CustomListStyle(
                            Icons.add_rounded,
                            'Redeployment',
                            () {
                              Navigator.of(context).popAndPushNamed('redeploy');
                            },
                          ),
                          CustomListStyle(
                            Icons.add_rounded,
                            'Travel Expenses Request',
                            () {
                              Navigator.of(context).popAndPushNamed('travel');
                            },
                          )
                        ],
                      ),
                    ),
                  CustomListStyle(
                    Icons.person,
                    'My Biodata',
                    onBioDataTap,
                  ),
                  if (bioDataExpanded)
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        children: <Widget>[
                          CustomListStyle(
                            Icons.add_rounded,
                            'Appraisal',
                            () => {},
                          ),
                          CustomListStyle(
                            Icons.add_rounded,
                            'Complaint',
                            () => {},
                          ),
                          CustomListStyle(
                            Icons.add_rounded,
                            'Conflict Report',
                            () => {},
                          ),
                          CustomListStyle(
                            Icons.add_rounded,
                            'Staff Exit',
                            () => {},
                          )
                        ],
                      ),
                    ),
                  CustomListStyle(
                    Icons.assessment_outlined,
                    'Activities',
                    () => {},
                  ),
                  SizedBox(
                    height: 300,
                  ),
                  CustomListStyle(
                    Icons.logout,
                    'Logout',
                    () => {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('login', (route) => false)
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.perm_contact_cal_rounded),
              label: 'Calender',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.insights),
              label: 'Reports',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.orange[700],
          unselectedItemColor: Colors.grey[400],
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w900),
          iconSize: 30.0,
          onTap: _onItemTap,
          elevation: 5.0),
    );
  }
}

// ignore: must_be_immutable
class CustomListStyle extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  CustomListStyle(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: InkWell(
        splashColor: Colors.orangeAccent,
        onTap: onTap,
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  Icon(icon),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      text,
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
