import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sample_flutter_app/AllScreens/mainscreen.dart';
import 'package:sample_flutter_app/AllScreens/registrationScreen.dart';
import 'package:sample_flutter_app/main.dart';

class LoginScreen extends StatelessWidget {
  static const idScreen = "login";

  TextEditingController loginEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Column(
        children: [
          SizedBox(
            height: 65.5,
          ),
          Image(
            image: AssetImage("assets/images/logo.png"),
            height: 290,
            width: 390,
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            "Login",
            style: TextStyle(fontSize: 30, fontFamily: "Bolt-Bold"),
          ),
          SizedBox(
            height: 2,
          ),
          Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                children: [
                  SizedBox(
                    height: 2,
                  ),
                  TextField(
                    controller: loginEditingController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "Login",
                        hintText: "enter your login",
                        labelStyle: TextStyle(fontSize: 14)),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  TextField(
                    controller: passwordEditingController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "enter your password",
                        labelStyle: TextStyle(fontSize: 14)),
                  )
                ],
              )),
          FlatButton(
            onPressed: () {
              tryLogin(context);
            },
            child: Text("LOGIN"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, RegistrationScreen.idScreen, (route) => false);
            },
            child: Text("Don't have account ? "),
          )
        ],
      ),
    );
  }

  final _firebaseAuth = FirebaseAuth.instance;

  void tryLogin(BuildContext context) async {
    final user = (await _firebaseAuth
            .signInWithEmailAndPassword(
                email: loginEditingController.text,
                password: passwordEditingController.text)
            .catchError((errMessage) {
      displayToast(errMessage.toString());
    }))
        .user;

    if (user != null) {
      Navigator.pushNamedAndRemoveUntil(
          context, MainScreen.idScreen, (route) => false);
    } else {
      displayToast("not LOGGED");
    }
  }
}
