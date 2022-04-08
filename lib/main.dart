import 'package:flutter/material.dart';
import 'package:task_intershala/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _fromkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/bg2.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Form(
            key: _fromkey,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 35, top: 100),
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.black),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.20,
                        left: 35,
                        right: 35),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.people),
                            fillColor: Colors.grey[100],
                            filled: true,
                            hintText: "Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your name";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.phone),
                              fillColor: Colors.grey[100],
                              filled: true,
                              hintText: "Mobile Number",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your phone number";
                            }
                            if (value.length < 9) {
                              return "Please enter valid phone number";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.email),
                              fillColor: Colors.grey[100],
                              filled: true,
                              hintText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your email";
                            }
                            if (!RegExp(
                                    '^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]')
                                .hasMatch(value)) {
                              return "Please enter valid mail";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              fillColor: Colors.grey[100],
                              filled: true,
                              hintText: "Password",
                              icon: Icon(Icons.visibility_off),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your password";
                            }
                            if (value.length < 7) {
                              return "Password should be at-least 8 characters";
                            }
                            if (value.length > 25) {
                              return "Password should be less than 25 characters";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Sign-up",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Color(0xff4c505b),
                              child: IconButton(
                                color: Colors.white,
                                iconSize: 35,
                                onPressed: () {
                                  if (_fromkey.currentState!.validate()) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                  } else {
                                    print("Unsuccessful");
                                  }
                                },
                                icon: Icon(Icons.arrow_forward),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              },
                              child: Text(
                                'Back to Login Page',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 18,
                                    color: Colors.grey[600]),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
