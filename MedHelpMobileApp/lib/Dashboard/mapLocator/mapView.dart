import 'dart:async';
import 'dart:convert';

import 'package:hackthon_app/Dashboard/mapLocator/categroyList.dart';
import 'package:hackthon_app/main.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shimmer/shimmer.dart';

class mapPage extends StatefulWidget {
  @override
  _mapPageState createState() => _mapPageState();
}

class _mapPageState extends State<mapPage> {
  MapType Mtype;
  final CameraPosition _initialCameraPosition = CameraPosition(
      target: LatLng(18.670534, 73.800077), bearing: 30, tilt: 70);
  GoogleMapController _controller;
  Set<Marker> markers;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Mtype = MapType.normal;
    markers = Set.from([]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            markers: markers,
            initialCameraPosition: _initialCameraPosition,
            mapType: Mtype,
            onMapCreated: (Controller) {
              setState(() {
                _controller = Controller;
              });
            },
            onTap: (cordinate) {
              _controller.animateCamera(CameraUpdate.newLatLng(cordinate));
              Marker mk1 = Marker(
                markerId: MarkerId('1'),
                position: cordinate,
              );
              setState(() {
                markers.add(mk1);
              });
            },
          ),

          //search opt currently disabled
          Positioned(
            top: 40,
            right: 15,
            left: 15,
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15, top: 15),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.1,
            maxChildSize: 0.8,
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
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.widgets,
                                        color: Colors.black54,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Categories",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  MyList(),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Container(
                                            width: double.infinity,
                                            height: 300,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black38,
                                                      blurRadius: 10,
                                                      offset: Offset(0, 8))
                                                ]),
                                            //Information of selected hospital will be shown below
                                            child: Shimmer.fromColors(
                                              baseColor: Colors.grey[200],
                                              highlightColor: Colors.white,
                                              child: Container(
                                                child: Column(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: <Widget>[
                                                          Container(
                                                            height: 100,
                                                            width: 100,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                color: Colors
                                                                    .grey[200]),
                                                          ),
                                                          Column(
                                                            children: <Widget>[
                                                              Container(
                                                                height: 10,
                                                                width: 100,
                                                                color: Colors
                                                                    .grey[200],
                                                              ),
                                                              SizedBox(
                                                                height: 15,
                                                              ),
                                                              Container(
                                                                height: 10,
                                                                width: 150,
                                                                color: Colors
                                                                    .grey[200],
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Column(
                                                        children: <Widget>[
                                                          Container(
                                                            height: 10,
                                                            width: 250,
                                                            color: Colors
                                                                .grey[200],
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Container(
                                                            height: 10,
                                                            width: 250,
                                                            color: Colors
                                                                .grey[200],
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Container(
                                                            height: 10,
                                                            width: 250,
                                                            color: Colors
                                                                .grey[200],
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Container(
                                                            height: 10,
                                                            width: 250,
                                                            color: Colors
                                                                .grey[200],
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ));
            },
          ),
        ],
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
              child: Icon(Icons.my_location),
              label: "My Location",
              onTap: () {
                //your loc
                _controller.animateCamera(
                  CameraUpdate.zoomTo(10),
                ); //currently geolocation off and loc feeded
              }),
          SpeedDialChild(
              child: Icon(Icons.map),
              label: "Mode",
              onTap: () {
                setState(() {
                  Mtype =
                      Mtype == MapType.normal ? MapType.hybrid : MapType.normal;
                });
              }),
        ],
      ),
    );
  }
}
