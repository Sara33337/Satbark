import 'package:amazon/screens/login.dart';
import 'package:amazon/screens/signup.dart';
import 'package:amazon/theme/AppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomPage extends StatelessWidget {
  const WelcomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      body: ListView(
        
        children: [
          // ElevatedButton(onPressed: (){
          
          //     SetMode();
            
            
          // }, 
          // child: Text("change"),),
        
        
        
            Container(
              height: 320,
              decoration: BoxDecoration(
                image: DecorationImage(image: 
              AssetImage("images/welcomePage.jpg",),
              fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)
              )),
            ),
            SizedBox(height: 50,),

          Center(
            child: Text(
              "LEARN ON THE GO",
              style:GoogleFonts.acme(
                textStyle : 
                TextStyle(fontSize: 27, fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 47, 47, 47)),
                
              )
               
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Manage your application with fun and secure",
                style: GoogleFonts.aDLaMDisplay(
                  textStyle : TextStyle(color: Colors.grey, fontSize: 15))
                
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SignUp();
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    width: 155,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(255, 116, 138, 153),
                    ),
                    child: Center(
                        child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Login();
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    width: 155,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        border: Border.all(
                            color: Color.fromARGB(255, 116, 138, 153))),
                    child: Center(
                        child: Text(
                      "Log In",
                      style: TextStyle(
                          color: Color.fromARGB(255, 116, 138, 153),
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
