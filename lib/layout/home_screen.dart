import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tds_statefull/modules/camera_screen.dart';
import 'package:tds_statefull/modules/control_screen.dart';
import 'package:tds_statefull/modules/location_screen.dart';
import 'package:tds_statefull/modules/mic_screen.dart';
import 'package:tds_statefull/modules/status_screen.dart';
import '../shared/components/components.dart';

class TdsStatefull extends StatefulWidget {
  @override
  State<TdsStatefull> createState() => _TdsStatefullState();
}

class _TdsStatefullState extends State<TdsStatefull> {
  int currentIndex = 0;

  List<Widget> screens = [
    CameraScreen(),
    // StatusScreen(),
    ControlScreen(),
    LocationScreen(),
    // MicScreen(),
  ];

  List<String> titles = [
    'Camera',
    // 'Status',
    'Control',
    'Location',
    // 'Mic',
  ];
  @override
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.camera_alt),
      label: 'Camera',
    ),
    // BottomNavigationBarItem(
    //   icon: Icon(Icons.insert_drive_file_rounded),
    //   label: 'Status',
    // ),
    BottomNavigationBarItem(
      icon: Icon(Icons.accessible_forward_sharp),
      label: 'Controls',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.location_on,
      ),
      label: 'Location',
    ),
    // BottomNavigationBarItem(
    //   icon: Icon(
    //     Icons.mic,
    //   ),
    //   label: 'Mic',
    // ),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Side menu',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              leading: Image(
                image: AssetImage('Assets/Images/Heart.jpg'),
                height: 50,
                width: 50,
              ),
              title: Text('BP: VALUE'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.black12,
              ),
            ),
            ListTile(
              leading: Image(
                image: AssetImage('Assets/Images/O2.jpg'),
                height: 50,
                width: 50,
              ),
              title: Text('O2: VALUE'),
            ),
            SizedBox(
              height: 400,
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(titles[currentIndex]),
        actions: [
          // Stack(alignment: AlignmentDirectional.bottomStart, children: [
          //   IconButton(
          //       onPressed: () {
          //         showDialog(
          //             context: context,
          //             builder: (context) => AlertDialog(
          //                   title: Text('ALERT!!!'),
          //                   content: Column(
          //                     mainAxisSize: MainAxisSize.min,
          //                     children: [
          //                       Text('الحقونااااااااااااااااااااااااااااااااااااااااااااااااااااااااي'),
          //                       Image(
          //                         fit: BoxFit.cover,
          //                         image: AssetImage('Assets/Images/اغيثونا.jpg'),
          //                         height: 200,
          //                         width: 200,
          //                       ),
          //                     ],
          //                   ),
          //                   actions: [
          //                     TextButton(
          //                         onPressed: () => Navigator.pop(context),
          //                         child: Text('OK'))
          //                   ],
          //                 ));
          //       },
          //       icon: Icon(Icons.notifications)),
          //   Padding(
          //     padding: const EdgeInsets.only(left: 9, bottom: 10.0),
          //     child: CircleAvatar(
          //       radius: 5,
          //       backgroundColor: Colors.red,
          //     ),
          //   ),
          // ]),
          IconButton(
              onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
              icon: Icon(Icons.menu)),
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: bottomItems,
        onTap: (index) {
          setState(() {
            changeBottomNavBar(index);
          });
        },
      ),
    );
  }
}
