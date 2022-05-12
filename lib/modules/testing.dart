import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class testing extends StatefulWidget {

  @override

  State<testing> createState() => _testingState();
}

class _testingState extends State<testing> {
  final Uri _url = Uri.parse('https://google.com');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: _launchUrl,
        child: Text('Show Flutter homepage'),
      ),
    );
  }




  void _launchUrl() async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }
}


