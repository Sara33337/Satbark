import 'package:amazon/BLogic/FireBase/Auth.dart';
import 'package:amazon/screens/RemainingInfo.dart';
import 'package:amazon/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _password_controller = TextEditingController();
  final TextEditingController _Confirmpassword = TextEditingController();
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
            padding: const EdgeInsets.only(left: 30, bottom: 10),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Create \nAccount",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "User Name",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    )),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Enter User Name",
                      suffixIcon: Icon(
                        Icons.clear_rounded,
                        color: Color.fromARGB(255, 116, 138, 153),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                )
              ],
            ),
          ),
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
                      suffixIcon: Icon(
                        Icons.clear_rounded,
                        color: Color.fromARGB(255, 116, 138, 153),
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
                      suffixIcon: IconButton(onPressed: (){
                        setState(() {
                   _passwordVisible = !_passwordVisible;});
                      },
                      icon:Icon(
                         _passwordVisible
                         ? Icons.visibility
                         : Icons.visibility_off,
                        
                        color: Color.fromARGB(255, 116, 138, 153),
                      ), ),
                      
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
                        "Confirm Password",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    )),
                TextField(
                  controller: _Confirmpassword,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                      hintText: "Confirm your Password",
                      suffixIcon: IconButton(
                        onPressed: (){
                        setState(() {
                   _passwordVisible = !_passwordVisible;});
                      },
                      icon:Icon(
                         _passwordVisible
                         ? Icons.visibility
                         : Icons.visibility_off,
                        
                        color: Color.fromARGB(255, 116, 138, 153),
                      ), ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              try {
                
                await Authentiction.CreateAcc(_emailcontroller.text.trim(),
                    _password_controller.text.trim());

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RemainingInfo();
                }));
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
                  "Create Account",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Already have an Account?",
              style: TextStyle(color: Colors.grey, fontSize: 17),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Login();
                  }));
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Color.fromARGB(255, 116, 138, 153),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
          ])
        ],
      ),
    );
  }
}
