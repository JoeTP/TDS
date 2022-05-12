import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MicScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.grey,
            ),
            child: IconButton(
              iconSize: 100,
              onPressed: (){},
              icon: Icon(
                Icons.mic,
              ),
            ),
          )
        ],
      ),
    );
  }
}
