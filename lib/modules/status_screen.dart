
import 'package:flutter/material.dart';

class StatusScreen extends StatefulWidget {

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: AssetImage('Assets/Images/Heart.jpg'),
                height: 50,
                width: 50,
              ),
              SizedBox(height: 10,),
              Text('Pressure',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),)
            ],
          ),
          SizedBox(width: 80,),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: AssetImage('Assets/Images/O2.jpg'),
                height: 100,
                width: 100,
              ),
              SizedBox(height: 10,),
              Text('Oxogyne',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),),
            ],
          ),
        ],
      ),
    );
  }
}
