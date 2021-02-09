import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

final databaseReference = FirebaseDatabase.instance.reference();
TextEditingController emailController;
TextEditingController pwdController;
TextEditingController nameController;
TextEditingController illnessController;
TextEditingController heightController;
TextEditingController ageController;
TextEditingController genderController;
TextEditingController mobileController;
TextEditingController pincodeController;
TextEditingController addressController;
TextEditingController doctorNameController;
TextEditingController patientController;
TextEditingController hospNameController;
List userData = new List();
List patientList = new List();
List hospDoctorList = new List();
List hospPatientList = new List();
var doctorCount;
var patientCount;
var bedCount;

void createRecord() {
  databaseReference.child("Patient").set({
    'Name': nameController.text,
  });
  databaseReference.child("Patient").child(nameController.toString()).set({
    'email': emailController.text,
    'age': ageController,
    'illness': illnessController,
    'height': heightController,
    'gender': genderController,
    'mobile': mobileController,
    'pincode': pincodeController,
    'address': addressController,
  });
}

void getPatientData() {
  databaseReference
      .child("Patient")
      .child(nameController.toString())
      .once()
      .then((DataSnapshot snapshot) {
    Map<dynamic, dynamic> values = snapshot.value;
    values.forEach((key, values) {
      userData.add(values);
    });
  });
}

void getDoctorData() {
  databaseReference
      .child("Doctor")
      .child(doctorNameController.toString())
      .once()
      .then((DataSnapshot snapshot) {
    Map<dynamic, dynamic> values = snapshot.value;
    values.forEach((key, values) {
      patientList.add(values);
    });
  });
}

void hospitalData() {
  databaseReference
      .child("Hospital")
      .child(hospNameController.toString())
      .child("Doctors")
      .once()
      .then((DataSnapshot snapshot) {
    Map<dynamic, dynamic> values = snapshot.value;
    values.forEach((key, values) {
      hospDoctorList.add(values);
      doctorCount = hospDoctorList.length;
    });
  });
}

void patientCountFunc() {
  databaseReference
      .child("Hospital")
      .child(hospNameController.toString())
      .child("Patients")
      .once()
      .then((DataSnapshot snapshot) {
    Map<dynamic, dynamic> values = snapshot.value;
    values.forEach((key, values) {
      hospPatientList.add(values);
      patientCount = hospPatientList.length;
    });
  });
}

void bedCountFunc() {
  databaseReference
      .child("Hospital")
      .child(hospNameController.toString())
      .once()
      .then((DataSnapshot snapshot) {
    bedCount = snapshot.value.values;
  });
}
