import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  static const idScreen = "registration";

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
                  print("test r");
                },
                child: Text("REGISTRATION"),
              ),
            ],
          ),
        ));
  }
}
