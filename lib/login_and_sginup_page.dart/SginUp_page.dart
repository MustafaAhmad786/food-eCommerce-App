import 'package:e_commerced_app/bottom_navigation_bar/navigation.dart';
import 'package:e_commerced_app/constraints.dart/apptext.dart';
import 'package:e_commerced_app/login_and_sginup_page.dart/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SginUp extends StatefulWidget {
  const SginUp({super.key});

  @override
  State<SginUp> createState() => _SginUpState();
}

class _SginUpState extends State<SginUp> {
  String Name = '', Password = '', Email = '';
  TextEditingController Namecontroller = new TextEditingController();
  TextEditingController Passwordcontroller = new TextEditingController();
  TextEditingController Emailcontroller = new TextEditingController();
  final formkey = GlobalKey<FormState>();
  registertion() async {
    if (Password != null) {
      try {
        // ignore: unused_local_variable
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: Email, password: Password);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Rigisterition is successfuly',
              style: TextStyle(fontSize: 18),
            ),
          ),
        );
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => bottomNavigation()));
      } on FirebaseException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                'password is provided is too weak',
                style: TextStyle(fontSize: 18),
              )));
        } else if (e.code == 'email-already sgin up') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                'Account already exists',
                style: TextStyle(fontSize: 18),
              )));
        }
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
            padding: const EdgeInsets.only(top: 380, left: 45),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Apptext(
                text: 'Already you have an account? Login',
                size: 20,
              ),
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
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  // sgin up area
                  margin: EdgeInsets.only(top: 15),
                  height: MediaQuery.of(context).size.height / 1.6,
                  width: MediaQuery.of(context).size.width / 1.3,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Apptext(
                          text: 'Sgin Up',
                          size: 25,
                        ),
                        SizedBox(height: 20),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'plase enter E-mail';
                              }
                              return null;
                            },
                            controller: Namecontroller,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person_2_outlined,
                                  color: Colors.black,
                                ),
                                hintText: 'Name',
                                hintStyle: TextStyle(
                                    fontSize: 18, color: Colors.black)),
                          ),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'plase enter E-mail';
                              }
                              return null;
                            },
                            controller: Emailcontroller,
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'plase enter E-mail';
                              }
                              return null;
                            },
                            controller: Passwordcontroller,
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
                        SizedBox(height: 25),
                        GestureDetector(
                          onTap: () {
                            if (formkey.currentState!.validate()) {
                              setState(() {
                                Email = Emailcontroller.text;
                                Name = Namecontroller.text;
                                Password = Passwordcontroller.text;
                              });
                              registertion();
                            }
                          },
                          child: Container(
                              height: 55,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.pinkAccent),
                              child: Center(
                                child: Text(
                                  'Sgin Up',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
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
