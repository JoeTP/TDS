import 'package:flutter/material.dart';

import '../mqtt.dart';

class ControlScreen extends StatefulWidget {
  @override
  State<ControlScreen> createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  int counterL = 0;
  int counterR = 0;
  int counterU = 0;
  int counterD = 0;
  int counterS = 0;
  bool buttonPressed = false;
  bool loopActive = false;

  void moveForward() async {
    // make sure that only one loop is active
    if (loopActive) return;
    loopActive = true;
    while (buttonPressed) {
      m3("UP");
      // counterU++;
      // wait a bit
      await Future.delayed(Duration(milliseconds: 100));
    }
    m3("STOP");


    loopActive = false;
  }

  void moveBackward() async {
    // make sure that only one loop is active
    if (loopActive) return;
    loopActive = true;
    while (buttonPressed) {
      m3("DOWN");
      // counterD++;

      // wait a bit
      await Future.delayed(Duration(milliseconds: 100));
    }
    m3("STOP");


    loopActive = false;
  }

  void moveLeft() async {
    // make sure that only one loop is active
    if (loopActive) return;
    loopActive = true;
    while (buttonPressed) {
      m3("LEFT");
      counterL++;

      // wait a bit
      await Future.delayed(Duration(milliseconds: 100));
    }
    m3("STOP");


    loopActive = false;
  }

  void moveRight() async {
    // make sure that only one loop is active
    if (loopActive) return;
    loopActive = true;
    while (buttonPressed) {
      m3("RIGHT");
      counterR++;
      // wait a bit
      await Future.delayed(Duration(milliseconds: 200));
    }
    m3("STOP");


    loopActive = false;
  }

  void stop() async {
    // make sure that only one loop is active
    if (loopActive) return;
    loopActive = true;
    while (buttonPressed) {
      m3("STOP");
      counterS++;
      // wait a bit
      await Future.delayed(Duration(milliseconds: 200));
    }

    loopActive = false;
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Listener(
              onPointerDown: (details) {
                buttonPressed = true;
                moveLeft();
              },
              onPointerUp: (details) {
                buttonPressed = false;
              },
              child: RawMaterialButton(
                elevation: 2.0,
                shape: CircleBorder(),
                fillColor: Colors.red,
                onPressed: () {},
                child: Icon(
                  Icons.keyboard_arrow_left_outlined,
                  color: Colors.white,
                  size: 60.0,
                ),
                constraints: BoxConstraints.tightFor(
                  width: 90.0,
                  height: 90.0,
                ),
              )),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Listener(
                  onPointerDown: (details) {
                    buttonPressed = true;
                    moveForward();
                  },
                  onPointerUp: (details) {
                    buttonPressed = false;
                  },
                  child: RawMaterialButton(
                    elevation: 2.0,
                    shape: CircleBorder(),
                    fillColor: Colors.red,
                    onPressed: () {},
                    child: Icon(
                      Icons.keyboard_arrow_up_outlined,
                      color: Colors.white,
                      size: 60.0,
                    ),
                    constraints: BoxConstraints.tightFor(
                      width: 90.0,
                      height: 90.0,
                    ),
                  )),
              SizedBox(
                height: 70,
              ),
              Listener(
                  onPointerDown: (details) {
                    buttonPressed = true;
                    moveBackward();
                  },
                  onPointerUp: (details) {
                    buttonPressed = false;
                  },
                  child: RawMaterialButton(
                    elevation: 2.0,
                    shape: CircleBorder(),
                    fillColor: Colors.red,
                    onPressed: () {},
                    child: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.white,
                      size: 60.0,
                    ),
                    constraints: BoxConstraints.tightFor(
                      width: 90.0,
                      height: 90.0,
                    ),
                  )),
            ],
          ),
          Listener(
              onPointerDown: (details) {
                buttonPressed = true;
                moveRight();
              },
              onPointerUp: (details) {
                buttonPressed = false;
              },
              child: RawMaterialButton(
                elevation: 2.0,
                shape: CircleBorder(),
                fillColor: Colors.red,
                onPressed: () {},
                child: Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: Colors.white,
                  size: 60.0,
                ),
                constraints: BoxConstraints.tightFor(
                  width: 90.0,
                  height: 90.0,
                ),
              )),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// import 'dart:async';
// import 'package:flutter/material.dart';
// import '../mqtt.dart';
//
// class ControlScreen extends StatefulWidget {
//   @override
//   State<ControlScreen> createState() => _ControlScreenState();
// }
//
// class _ControlScreenState extends State<ControlScreen> {
//   int _counter = 0;
//   bool _buttonPressed = false;
//   bool _loopActive = false;
//
//   void moveForward() async {
//     // make sure that only one loop is active
//     if (_loopActive) return;
//     _loopActive = true;
//     while (_buttonPressed) {
//       setState(() {
//         m3("UP");
//         _counter++;
//       });
//       // wait a bit
//       await Future.delayed(Duration(milliseconds: 200));
//     }
//
//     _loopActive = false;
//   }
//   void moveBackward() async {
//     // make sure that only one loop is active
//     if (_loopActive) return;
//     _loopActive = true;
//     while (_buttonPressed) {
//       setState(() {
//         m3("DOWN");
//         _counter++;
//       });
//       // wait a bit
//       await Future.delayed(Duration(milliseconds: 200));
//     }
//
//     _loopActive = false;
//   }
//   void moveLeft() async {
//     // make sure that only one loop is active
//     if (_loopActive) return;
//     _loopActive = true;
//     while (_buttonPressed) {
//       setState(() {
//         m3("LEFT");
//         _counter++;
//       });
//       // wait a bit
//       await Future.delayed(Duration(milliseconds: 200));
//     }
//
//     _loopActive = false;
//   }
//   void moveRight() async {
//     // make sure that only one loop is active
//     if (_loopActive) return;
//     _loopActive = true;
//     while (_buttonPressed) {
//       setState(() {
//         m3("RIGHT");
//         _counter++;
//       });
//       // wait a bit
//       await Future.delayed(Duration(milliseconds: 200));
//     }
//
//     _loopActive = false;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Listener(
//               onPointerDown: (details) {
//                 _buttonPressed = true;
//                 moveLeft();
//               },
//               onPointerUp: (details) {
//                 _buttonPressed = false;
//               },
//               child: Container(
//                 decoration: BoxDecoration(color: Colors.orange, border: Border.all()),
//                 padding: EdgeInsets.all(16.0),
//                 child: Text('Value: $_counter'),
//               ),
//             ),
//             Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Listener(
//                     onPointerDown: (details) {
//                       _buttonPressed = true;
//                       moveForward();
//                     },
//                     onPointerUp: (details) {
//                       _buttonPressed = false;
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(color: Colors.orange, border: Border.all()),
//                       padding: EdgeInsets.all(16.0),
//                       child: Text('Value: $_counter'),
//                     ),
//                   ),
//                   Listener(
//                     onPointerDown: (details) {
//                       _buttonPressed = true;
//                       moveBackward();
//                     },
//                     onPointerUp: (details) {
//                       _buttonPressed = false;
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(color: Colors.orange, border: Border.all()),
//                       padding: EdgeInsets.all(16.0),
//                       child: Text('Value: $_counter'),
//                     ),
//                   ),
//                 ]),
//             Listener(
//               onPointerDown: (details) {
//                 _buttonPressed = true;
//                 moveRight();
//               },
//               onPointerUp: (details) {
//                 _buttonPressed = false;
//               },
//               child: Container(
//                 decoration: BoxDecoration(color: Colors.orange, border: Border.all()),
//                 padding: EdgeInsets.all(16.0),
//                 child: Text('Value: $_counter'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
