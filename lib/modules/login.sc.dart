import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../layout/home_screen.dart';

class LoginSc extends StatefulWidget {
  @override
  State<LoginSc> createState() => _LoginScState();
}

class _LoginScState extends State<LoginSc> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool showPass = true;

  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('the error: ${e.toString()}');
      if (e.code == "user-not-found") {
        print("no user found for that email");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'Field is required.';
                      return null;
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'E-mail Address',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: passController,
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
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    height: 38,
                    onPressed: () async {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => TdsStatefull(),
                      //   ),
                      // );
                      // if (emailController == 'qweqweqwe@qwe.com' &&
                      //     passController == '123123123') {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => TdsStatefull(),
                      //     ),
                      //   );
                      // } else {
                      //   return null;
                      // }
                      User? user = await loginUsingEmailPassword(
                          email: emailController.text,
                          password: passController.text,
                          context: context);
                      print(user);
                      print(emailController.text);
                      print(passController.text);
                      if (user != null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TdsStatefull(),
                          ),
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    color: Colors.blue,
                  ),


                  //USERNAME: chair1@tcw.com
                  //PASSWORD: 123456
                  MaterialButton(
                    height: 38,
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TdsStatefull(),
                        ),
                      );
                      // if (emailController == 'qweqweqwe@qwe.com' &&
                      //     passController == '123123123') {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => TdsStatefull(),
                      //     ),
                      //   );
                      // } else {
                      //   return null;
                      // }

                      // User? user = await loginUsingEmailPassword(
                      //     email: emailController.text,
                      //     password: passController.text,
                      //     context: context);
                      // print(user);
                      // print(emailController.text);
                      // print(passController.text);

                      // if (user != null) {
                      //   Navigator.pushReplacement(context,
                      //     MaterialPageRoute(
                      //       builder: (context) => TdsStatefull(),
                      //     ),
                      //   );
                      // }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'test',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    color: Colors.blue,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
