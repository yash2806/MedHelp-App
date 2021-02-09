import 'dart:developer';
import 'package:hackthon_app/main.dart';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dbFunc.dart';

//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'commonComponents/customCard.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title, this.uid})
      : super(key: key); //update this to include the uid in the constructor
  final String title;
  final String uid; //include this

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController taskTitleInputController;
  TextEditingController taskDescripInputController;
  FirebaseUser currentUser;
  final databaseReference = FirebaseDatabase.instance.reference();

  var s;

  @override
  initState() {
    taskTitleInputController = new TextEditingController();
    taskDescripInputController = new TextEditingController();
    this.getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    currentUser = await FirebaseAuth.instance.currentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Demo'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              FirebaseAuth auth = FirebaseAuth.instance;
              auth.signOut().then((res) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              });
            },
          )
        ],
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            child: Text('Create Record'),
            onPressed: () {
              createRecord();
            },
          ),
          RaisedButton(
            child: Text('View Record'),
            onPressed: () {
              databaseReference.child('2').once().then((DataSnapshot snapshot) {
                print(snapshot.key);
                print(snapshot.value['title']);
                setState(() {
                  s = snapshot.value['title'].toString();
                });
              });
            },
          ),
          RaisedButton(
            child: Text('Update Record'),
            onPressed: () {
              getPatientData();
            },
          ),
          RaisedButton(
            child: Text('Delete Record'),
            onPressed: () {
              null;
            },
          ),
          Text(s ?? "name"),
        ],
      )),
    );
  }
}
