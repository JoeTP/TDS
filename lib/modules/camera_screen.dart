
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CameraScreen extends StatefulWidget {
  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  // final Uri _url = Uri.parse('https://google.com');

  String url = 'https://google.com';
  var urlController = TextEditingController();
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Expanded(
            child: WebView(

              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: url,
              onPageStarted: (url){

                print('current Page: $url');
              },
            ),
          ),
          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 280,
                child: TextFormField(
                  controller: urlController,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      print("form submitted.");
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Field is required.';
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter URL',
                  ),
                ),
              ),
              SizedBox(width: 10,),
              MaterialButton(
                height: 38,
                minWidth: 35,
                onPressed: () async {

                },
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    'Go',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                color: Colors.blue,
              ),

            ],
          ),
          SizedBox(height: 5,),


          // FloatingActionButton(
          //   onPressed: (){
          //
          //   },
          //   // onPressed: _launchUrl,
          //   child: Icon(
          //     Icons.camera_alt,
          //   ),
          // ),

        ],
      ),
    );
  }




  // void _launchUrl() async {
  //   if (!await launchUrl(_url)) throw 'Could not launch $_url';
  // }
}
