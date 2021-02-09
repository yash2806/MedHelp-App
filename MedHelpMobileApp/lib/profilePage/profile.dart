import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackthon_app/loginPage/splash.dart';
import 'package:hackthon_app/startPage.dart';

class profilePage extends StatefulWidget {
  @override
  _profilePageState createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          leading: InkWell(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pushNamed(context, '/patientDashboard');
            },
          ),
          title: Text("Profile"),
          centerTitle: true,
        ),
        body: Stack(children: <Widget>[
          Positioned(
            top: 30,
            left: 30,
            right: 30,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: SizedBox(
                            child: Icon(
                          Icons.account_circle,
                          color: Colors.black45,
                          size: 100,
                        )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Users Name",
                  style: TextStyle(color: Colors.black54, fontSize: 20),
                ),
                SizedBox(height: 40),
                FlatButton(
                  child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black38,
                                blurRadius: 10,
                                offset: Offset(0, 8))
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Image(
                                image:
                                    AssetImage("assets/images/accSetup.png")),
                            Container(
                              width: 150,
                              child: Text(
                                'Click here to setup your profile',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  onPressed: () {
                    Navigator.pushNamed(context, '/detailsForm');
                  },
                ),

                //currently switch account feature is not working
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white),
                  child: FlatButton(
                    child: Center(
                      child: Text(
                        "Switch Account",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onPressed: () {
                      null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white),
                  child: FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.exit_to_app, color: Colors.blue[400]),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Logout",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    onPressed: () {
                      FirebaseAuth auth = FirebaseAuth.instance;
                      auth.signOut().then((res) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => startPage()),
                        );
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.1,
            maxChildSize: 0.76,
            minChildSize: 0.1,
            builder: (context, scrollController) {
              return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40)),
                  ),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40),
                                  topLeft: Radius.circular(40)),
                            ),

                            //currently setting are for showcase only about us working

                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Settings",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 40,
                                        child: Divider(
                                          thickness: 1,
                                          indent: 8,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 20),
                                        child: Column(
                                          children: <Widget>[
                                            InkWell(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.account_box,
                                                        color:
                                                            Colors.green[600],
                                                        size: 35,
                                                      ),
                                                      SizedBox(
                                                        width: 40,
                                                      ),
                                                      Text(
                                                        "General",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                    ],
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.black45,
                                                    size: 18,
                                                  )
                                                ],
                                              ),
                                              onTap: () {
                                                print("button pressed");
                                              },
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            InkWell(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons
                                                            .supervisor_account,
                                                        color: Colors.red[600],
                                                        size: 35,
                                                      ),
                                                      SizedBox(
                                                        width: 40,
                                                      ),
                                                      Text(
                                                        "Accounts",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                    ],
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.black45,
                                                    size: 18,
                                                  )
                                                ],
                                              ),
                                              onTap: () {
                                                print("button pressed");
                                              },
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            InkWell(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.g_translate,
                                                        color: Colors.blue[600],
                                                        size: 35,
                                                      ),
                                                      SizedBox(
                                                        width: 40,
                                                      ),
                                                      Text(
                                                        "Languages",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                    ],
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.black45,
                                                    size: 18,
                                                  )
                                                ],
                                              ),
                                              onTap: () {
                                                print("button pressed");
                                              },
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            InkWell(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons
                                                            .chrome_reader_mode,
                                                        color: Colors.grey[600],
                                                        size: 35,
                                                      ),
                                                      SizedBox(
                                                        width: 40,
                                                      ),
                                                      Text(
                                                        "Theme",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                    ],
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.black45,
                                                    size: 18,
                                                  )
                                                ],
                                              ),
                                              onTap: () {
                                                print("button pressed");
                                              },
                                            ),
                                            SizedBox(
                                              height: 45,
                                              child: Divider(
                                                thickness: 1,
                                                indent: 8,
                                              ),
                                            ),
                                            InkWell(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.chat,
                                                        color: Colors.orange,
                                                        size: 35,
                                                      ),
                                                      SizedBox(
                                                        width: 40,
                                                      ),
                                                      Text(
                                                        "About Us",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                    ],
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: Colors.black45,
                                                    size: 18,
                                                  )
                                                ],
                                              ),
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context, '/aboutUs');
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                  ));
            },
          ),
        ]));
  }
}
