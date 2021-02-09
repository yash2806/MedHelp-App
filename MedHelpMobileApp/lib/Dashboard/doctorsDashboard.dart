import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class doctorsDashboardPage extends StatefulWidget {
  @override
  _doctorsDashboardPageState createState() => _doctorsDashboardPageState();
}

class _doctorsDashboardPageState extends State<doctorsDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 10,
        automaticallyImplyLeading: false,
        title: Center(child: Text("Doctor's Dashboard")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                  ),
                  child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Check Your",
                            style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.w400,
                                fontSize: 25),
                          ),
                          Text(
                            "Patients Details",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w600,
                                fontSize: 35),
                          ),
                          SizedBox(height: 30),
                          Image(
                              image: AssetImage(
                                  'assets/images/recordsHistory.png')),
                        ],
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.warning,
                      color: Colors.green,
                    ),
                    Text("Currently No data Present")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent, //curve color
        color: Colors.blue, //background color
        buttonBackgroundColor: Colors.blue, //circle color
        height: 60,
        index: 0,

        items: <Widget>[
          Icon(Icons.home, size: 28, color: Colors.white),
          Icon(
            Icons.account_circle,
            size: 28,
            color: Colors.white,
          )
        ],

        onTap: (index) {
          setState(() {
            if (index == 0) {
              //home
            } else {
              Navigator.pushNamed(context, '/profile');
            }
          });
        },
      ),
    );
  }
}
