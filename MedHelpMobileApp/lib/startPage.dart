import 'package:flutter/material.dart';

class startPage extends StatefulWidget {
  startPage({Key key}) : super(key: key);
  @override
  _startPageState createState() => _startPageState();
}

class _startPageState extends State<startPage> with TickerProviderStateMixin {
  bool isFinalState = false;
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _toggle() {
    setState(() {
      isFinalState = !isFinalState;
      if (!isFinalState)
        _controller.reverse(from: 1.0);
      else
        _controller.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AnimatedBuilder(
                animation: _controller,
                builder: (context, anim) {
                  final double progress = _animation.value;
                  final double heightScaling =
                      0.655 + (0.637 - 0.805) * progress;
                  final double height =
                      MediaQuery.of(context).size.height * heightScaling;
                  return ClipPath(
                    clipper: BezierClipper(progress),
                    child: Container(
                      width: double.infinity,
                      color: Colors.blue,
                      height: height,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex: 2,
                                  child: InkWell(
                                    onTap: _toggle,
                                    child: Container(
                                      height: 200,
                                      child: Image(
                                          image: AssetImage(
                                              'assets/images/doctor.png')),
                                    ),
                                  )),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.white),
                                  child: FlatButton(
                                    child: Center(
                                      child: Text(
                                        "Are You a Doctor?",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/doctorsLogin');
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.blue),
                        child: FlatButton(
                          child: Center(
                            child: Text(
                              "Are You a Patient?",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/splashPage');
                          },
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: InkWell(
                          onTap: _toggle,
                          child: Container(
                            height: 200,
                            child: Image(
                                image: AssetImage('assets/images/patient.png')),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BezierClipper extends CustomClipper<Path> {
  final double progress;
  BezierClipper(this.progress);

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

  @override
  Path getClip(Size size) {
    Path path = Path();
    final double artboardW = 414 + (0) * progress;
    final double artboardH = 363.15 + (-61.45999999999998) * progress;
    final double _xScaling = size.width / artboardW;
    final double _yScaling = size.height / artboardH;
    path.lineTo((0 + (0) * progress) * _xScaling,
        (341.78499999999997 + (-123.94399999999996) * progress) * _yScaling);
    path.cubicTo(
      (0 + (0) * progress) * _xScaling,
      (341.78499999999997 + (-123.94399999999996) * progress) * _yScaling,
      (23.465 + (-4.3210000000000015) * progress) * _xScaling,
      (363.15099999999995 + (-97.231) * progress) * _yScaling,
      (71.55699999999999 + (-4.319999999999993) * progress) * _xScaling,
      (363.15099999999995 + (-97.231) * progress) * _yScaling,
    );
    path.cubicTo(
      (119.649 + (-4.319000000000017) * progress) * _xScaling,
      (363.15099999999995 + (-97.231) * progress) * _yScaling,
      (142.221 + (-29.465000000000003) * progress) * _xScaling,
      (300.186 + (-65.57499999999999) * progress) * _yScaling,
      (203.299 + (-29.462000000000018) * progress) * _xScaling,
      (307.21 + (-65.57499999999999) * progress) * _yScaling,
    );
    path.cubicTo(
      (264.377 + (-29.45900000000003) * progress) * _xScaling,
      (314.234 + (-65.57499999999999) * progress) * _yScaling,
      (282.66999999999996 + (-9.799999999999955) * progress) * _xScaling,
      (333.47299999999996 + (-31.781999999999982) * progress) * _yScaling,
      (338.412 + (-9.800000000000011) * progress) * _xScaling,
      (333.47299999999996 + (-31.781999999999982) * progress) * _yScaling,
    );
    path.cubicTo(
      (394.154 + (-9.800000000000068) * progress) * _xScaling,
      (333.47299999999996 + (-31.781999999999982) * progress) * _yScaling,
      (414 + (0) * progress) * _xScaling,
      (254.199 + (-52.22200000000001) * progress) * _yScaling,
      (414 + (0) * progress) * _xScaling,
      (254.199 + (-52.22200000000001) * progress) * _yScaling,
    );
    path.cubicTo(
      (414 + (0) * progress) * _xScaling,
      (254.199 + (-52.22200000000001) * progress) * _yScaling,
      (414 + (0) * progress) * _xScaling,
      (0 + (0) * progress) * _yScaling,
      (414 + (0) * progress) * _xScaling,
      (0 + (0) * progress) * _yScaling,
    );
    path.cubicTo(
      (414 + (0) * progress) * _xScaling,
      (0 + (0) * progress) * _yScaling,
      (2.1316282072803006e-14 + (0) * progress) * _xScaling,
      (0 + (0) * progress) * _yScaling,
      (2.1316282072803006e-14 + (0) * progress) * _xScaling,
      (0 + (0) * progress) * _yScaling,
    );
    path.cubicTo(
      (2.1316282072803006e-14 + (0) * progress) * _xScaling,
      (0 + (0) * progress) * _yScaling,
      (0 + (0) * progress) * _xScaling,
      (341.78499999999997 + (-123.94399999999996) * progress) * _yScaling,
      (0 + (0) * progress) * _xScaling,
      (341.78499999999997 + (-123.94399999999996) * progress) * _yScaling,
    );
    return path;
  }
}
