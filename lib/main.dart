import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wave_animation/wave/waveWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double height;
  double speed;
  List<Color> colors;
  @override
  void initState() {
    colors = [Colors.blue[300], Colors.blue[900]];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeOutQuad,
                top: 0,
                child: WaveWidget(
                  size: MediaQuery.of(context).size,
                  yOffset: MediaQuery.of(context).size.height / 3.0,
                  colors: colors,
                  waveHeight: height ?? 30,
                  waveSpeed: 1080,
                ),
              ),
              Positioned(
                top: 10,
                child: Container(
                  color: Colors.transparent,
                  width: w,
                  height: h * .3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     Container(
                      //       width: w * .4,
                      //       height: h * .1,
                      //       child: TextField(
                      //         keyboardType: TextInputType.number,
                      //         decoration: InputDecoration(
                      //           enabledBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(10),
                      //           ),
                      //           focusedBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(10),
                      //           ),
                      //           labelText: 'Wave Height',
                      //         ),
                      //         onChanged: (value) {
                      //           if (value.isEmpty) {
                      //             value = 0.toString();
                      //           }
                      //           if (double.parse(value) < 80 &&
                      //               double.parse(value) > 10) {
                      //             try {
                      //               setState(() {
                      //                 height = double.parse(value);
                      //               });
                      //             } on Exception catch (e) {}
                      //           }
                      //         },
                      //       ),
                      //     ),
                      //     Container(
                      //       width: w * .4,
                      //       height: h * .1,
                      //       child: TextField(
                      //         keyboardType: TextInputType.number,
                      //         decoration: InputDecoration(
                      //           enabledBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(10),
                      //           ),
                      //           focusedBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(10),
                      //           ),
                      //           labelText: 'Wave Speed',
                      //         ),
                      //         onChanged: (value) {
                      //           if (value.isEmpty) {
                      //             value = 0.toString();
                      //           }
                      //           if (double.parse(value) <= 1080 &&
                      //               double.parse(value) >= 800) {
                      //             try {
                      //               setState(() {
                      //                 speed = double.parse(value);
                      //               });
                      //             } on Exception catch (e) {}
                      //           }
                      //         },
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Color:',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          ColorWidget(Colors.blue,
                              [Colors.blue[300], Colors.blue[900]]),
                          ColorWidget(Colors.red[800],
                              [Colors.red[100], Colors.red[900]]),
                          ColorWidget(Colors.green,
                              [Colors.green[100], Colors.green[900]]),
                          ColorWidget(Colors.orange[800],
                              [Colors.orange[100], Colors.orange[900]]),
                          ColorWidget(Colors.pink,
                              [Colors.pink[100], Colors.pink[900]]),
                          ColorWidget(Colors.purple,
                              [Colors.purple[100], Colors.purple[900]]),
                        ],
                      ),
                      SizedBox(
                        height: h * .01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Height:',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  heightButton(20),
                                  SizedBox(
                                    width: w * .01,
                                  ),
                                  heightButton(30),
                                  SizedBox(
                                    width: w * .01,
                                  ),
                                  heightButton(40),
                                ],
                              ),
                              Row(
                                children: [
                                  heightButton(50),
                                  SizedBox(
                                    width: w * .01,
                                  ),
                                  heightButton(60),
                                  SizedBox(
                                    width: w * .01,
                                  ),
                                  heightButton(70),
                                ],
                              ),
                              Row(
                                children: [
                                  heightButton(80),
                                  SizedBox(
                                    width: w * .01,
                                  ),
                                  heightButton(90),
                                  SizedBox(
                                    width: w * .01,
                                  ),
                                  heightButton(100),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget heightButton(double h) {
    return FlatButton(
      color: Colors.blue[100].withOpacity(0.5),
      onPressed: () {
        setState(() {
          height = h;
        });
      },
      child: Text(
        '${h.toInt().toString()}',
      ),
    );
  }

  Widget ColorWidget(Color c, List<Color> colorsChange) {
    return GestureDetector(
      onTap: () {
        setState(() {
          colors = colorsChange;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .1,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: c,
        ),
      ),
    );
  }
}
