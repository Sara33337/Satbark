import 'package:amazon/BLogic/FireBase/Auth.dart';
import 'package:amazon/screens/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailcontroller = TextEditingController();

  final TextEditingController _password_controller = TextEditingController();

  bool _passwordVisible = false;
  
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 5),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Your Email",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    )),
                TextField(
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                      hintText: "Enter Your Email",
                      suffixIcon: IconButton(
                        onPressed: () {
                          _emailcontroller.clear();
                        },
                        icon: Icon(
                          Icons.clear_rounded,
                          color: Color.fromARGB(255, 116, 138, 153),
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5, right: 30, left: 30),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    )),
                TextField(
                  controller: _password_controller,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                      hintText: "Enter your Password",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Color.fromARGB(255, 116, 138, 153),
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              try {
                if (_emailcontroller.text == "" ||
                    _password_controller.text == "") {
                  final snackbar =
                      SnackBar(content: Text("Enter You Email and Password"));
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                } else {
                  await Authentiction.Login(_emailcontroller.text.trim(),
                      _password_controller.text.trim());

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }));
                }
              } catch (e) {
                print(e);
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 35),
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 116, 138, 153),
                ),
                child: Center(
                    child: Text(
                  "Log In",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
