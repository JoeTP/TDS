import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            color: Colors.grey,
            width: double.infinity,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage('Assets/Images/Map.jpg'),
              height: 100,
              width: 100,
            ),
          ),
        ),
        SizedBox(height: 25,),
        FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.my_location,
          ),
        ),
        SizedBox(height: 25,),

      ],
    );
  }
}
