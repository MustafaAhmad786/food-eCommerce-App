import 'package:e_commerced_app/bottom_navigation_bar/navigation.dart';
import 'package:e_commerced_app/constraints.dart/apptext.dart';
import 'package:e_commerced_app/login_and_sginup_page.dart/Forgot_password_page.dart';
import 'package:e_commerced_app/login_and_sginup_page.dart/SginUp_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '', password = '';
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroler = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  userlogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => bottomNavigation()));
    } on FirebaseException catch (e) {
      if (e.code == 'user is not found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'No user found for that email',
              style: TextStyle(fontSize: 20),
            )));
      } else if (e.code == 'wrong password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          'wrong password provided by user',
          style: TextStyle(fontSize: 20),
        )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 300,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              const Color.fromARGB(255, 243, 33, 236),
              Color.fromARGB(255, 168, 37, 127),
            ]),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 70),
            child: Image.asset(
              'assets/logo/food1.png',
              scale: 1.0,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 1.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50))),
          child: Padding(
            padding: const EdgeInsets.only(top: 350, left: 10),
            child: Container(
              height: 20,
              width: MediaQuery.of(context).size.width,
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SginUp()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 60,
                    ),
                    child: Apptext(
                        text: 'Already have an account? Sgin up', size: 20),
                  )),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40, top: 150),
          child: Material(
            elevation: 5.5,
            shadowColor: Colors.amber,
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                margin: EdgeInsets.only(top: 30),
                height: MediaQuery.of(context).size.height / 1.8,
                width: MediaQuery.of(context).size.width / 1.3,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: Form(
                  key: _formkey,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Apptext(
                          text: 'Login',
                          size: 25,
                        ),
                        SizedBox(height: 20),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          child: TextFormField(
                            controller: emailcontroller,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'email field';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.black,
                                ),
                                hintText: 'email',
                                hintStyle: TextStyle(
                                    fontSize: 18, color: Colors.black)),
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          child: TextFormField(
                            controller: passwordcontroler,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'password field';
                              }
                              return null;
                            },
                            obscureText: true,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.password,
                                  color: Colors.black,
                                ),
                                hintText: 'password',
                                hintStyle: TextStyle(
                                    fontSize: 18, color: Colors.black)),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgotPassword()));
                              },
                              child: Apptext(
                                text: 'Forget Password?',
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 45),
                        GestureDetector(
                          onTap: () {
                            if (_formkey.currentState!.validate()) {
                              setState(() {
                                email = emailcontroller.text;
                                password = passwordcontroler.text;
                              });
                              userlogin();
                            }
                          },
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                                height: 55,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Colors.pinkAccent,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
