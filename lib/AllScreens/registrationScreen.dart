import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sample_flutter_app/AllScreens/mainscreen.dart';
import 'package:sample_flutter_app/main.dart';

class RegistrationScreen extends StatelessWidget {
  static const idScreen = "registration";

  TextEditingController nameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amberAccent,
        body: SingleChildScrollView(
          child: Column(
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
                        controller: nameEditingController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Name",
                            hintText: "enter your name",
                            labelStyle: TextStyle(fontSize: 14)),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      TextField(
                        controller: emailEditingController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "enter your email",
                            labelStyle: TextStyle(fontSize: 14)),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      TextField(
                        controller: phoneEditingController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            labelText: "Phone",
                            hintText: "enter your phone",
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
                  registerUser(context);
                },
                child: Text("REGISTRATION"),
              ),
            ],
          ),
        ));
  }

  final _firebaseAuth = FirebaseAuth.instance;

  void registerUser(BuildContext context) async {
    if (nameEditingController.text.length < 5) {
      displayToast("Short name");
    }

    final user = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailEditingController.text,
                password: passwordEditingController.text)
            .catchError((errMessage) {
      displayToast(errMessage.toString());
    }))
        .user;

    if(user != null) {
      Map userData = {
        "name": nameEditingController.text,
        "email": emailEditingController.text,
        "phone": phoneEditingController.text,
      };

      usersRef.child(user.uid).set(userData);

      Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
    }else{
      displayToast("not registered");
    }
  }
}
