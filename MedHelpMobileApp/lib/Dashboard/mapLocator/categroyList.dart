import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                mylstView(txt: "Cardiac"),
                mylstView(txt: "Lungs"),
                mylstView(txt: "Brain"),
                mylstView(txt: "Dentist"),
                mylstView(txt: "dermatologist"),
                //more options can be added here
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class mylstView extends StatelessWidget {
  final String txt;

  mylstView({this.txt});
  Color clr = Colors.grey[200];
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("button pressed was $txt");
        clr = Colors.blue;
      }, //for map loc findings
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            width: 120,
            decoration: BoxDecoration(
                border: Border.all(
                  width: 0,
                ),
                color: clr,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10,
                      offset: Offset(0, 2))
                ]),
            child: Center(child: Text(txt))

            //Image(image: AssetImage('assets/images/')),

            ),
      ),
    );
  }
}
