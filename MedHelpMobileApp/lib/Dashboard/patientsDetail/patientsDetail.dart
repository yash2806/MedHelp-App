import 'package:flutter/material.dart';

enum Gender { MALE, FEMALE, OTHER }

class detailsForm extends StatefulWidget {
  @override
  _detailsFormState createState() => _detailsFormState();
}

class _detailsFormState extends State<detailsForm> {
  int _currentStep = 0;
  Gender _genderValue = Gender.MALE;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SetUp Users Information"),
          centerTitle: true,
        ),
        body: Stepper(
          steps: _stepper(),
          physics: ClampingScrollPhysics(),
          currentStep: this._currentStep,
          onStepTapped: (step) {
            setState(() {
              this._currentStep = step;
            });
          },
          onStepContinue: () {
            setState(() {
              if (this._currentStep < this._stepper().length - 1) {
                this._currentStep = this._currentStep + 1;
              } else {
                print('Form completly filled');
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (this._currentStep > 0) {
                this._currentStep = this._currentStep - 1;
              } else {
                this._currentStep = 0;
              }
            });
          },
        ));
  }

  List<Step> _stepper() {
    List<Step> _steps = [
      Step(
          title: Text("General Information"),
          content: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'First Name'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Last Name'),
              ),
              SizedBox(
                height: 20,
              ),
              RadioListTile(
                title: const Text('Male'),
                value: Gender.MALE,
                groupValue: _genderValue,
                onChanged: (Gender value) {
                  setState(() {
                    _genderValue = value;
                  });
                },
              ),
              RadioListTile(
                title: const Text('Female'),
                value: Gender.FEMALE,
                groupValue: _genderValue,
                onChanged: (Gender value) {
                  setState(() {
                    _genderValue = value;
                  });
                },
              ),
              RadioListTile(
                title: const Text('Other'),
                value: Gender.OTHER,
                groupValue: _genderValue,
                onChanged: (Gender value) {
                  setState(() {
                    _genderValue = value;
                  });
                },
              ),
            ],
          ),
          isActive: _currentStep >= 0,
          state: StepState.complete),
      Step(
          title: Text("Address Information"),
          content: Column(
            children: <Widget>[
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Email Address(optional)'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Residential Address'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Pincode'),
              ),
            ],
          ),
          isActive: _currentStep >= 1,
          state: StepState.disabled),
      Step(
          title: Text("Contact Information"),
          content: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Mobile No.'),
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Landline no.(optional)'),
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Emergency Contact Number'),
              ),
            ],
          ),
          isActive: _currentStep >= 2,
          state: StepState.disabled),
      Step(
          title: Text("Medical Information"),
          content: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Age'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Date of Birth'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Height'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Weight'),
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Any Allergies to mention'),
              ),
            ],
          ),
          isActive: _currentStep >= 3,
          state: StepState.editing),
    ];
    return _steps;
  }
}
