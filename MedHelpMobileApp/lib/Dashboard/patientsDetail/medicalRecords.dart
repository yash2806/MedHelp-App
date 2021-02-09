import 'package:flutter/material.dart';

class medicalRecords extends StatefulWidget {
  @override
  _medicalRecordsState createState() => _medicalRecordsState();
}

class _medicalRecordsState extends State<medicalRecords> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Text("Records"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: Colors.white),
              child: Row(
                children: <Widget>[
                  Container(
                      height: 200,
                      width: 250,
                      child: Image.asset('assets/images/recordsHistory.png')),
                  Expanded(
                      child: Text(
                    "Medical History",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }
}
