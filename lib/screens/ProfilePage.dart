import 'package:amazon/Models/CartItem.dart';
import 'package:amazon/Models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static final auth = FirebaseAuth.instance;
  UserModel? user;

  String FName = '';
  String SName = '';
  String PhNumber = '';
  String Gender = '';
  String Country = '';

  Future<void> GestUserInfo() async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(auth.currentUser!.uid)
        .get()
        .then((value) {
      if (value.exists) {
        setState(() {
          FName = value.data()!['FName'];
          SName = value.data()!['SName'];
          PhNumber = value.data()!['PhNumber'];
          Gender = value.data()!['Gemder'];
          Country = value.data()!['Country'];
        });
      } else {
        print("No Data");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    GestUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User profile",
            style: GoogleFonts.aDLaMDisplay(
              textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(255, 100, 94, 94)),
            )),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            CircleAvatar(
              backgroundColor: Color.fromARGB(255, 231, 222, 222),
              radius: 50,
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${FName} ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(SName,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))
                  ],
                ),
                Text("+20 " + PhNumber)
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart_rounded),
              title: Text("Total Orders"),
              trailing: Text(Cartitems.length.toString()),
            ),
            ListTile(
              leading: Icon(Icons.notification_important_outlined),
              title: Text("Notifications"),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 13,
              ),
            ),
            ListTile(
              leading: Icon(Icons.place_outlined),
              title: Text("Country"),
              trailing: Text("Egypt"),
            ),
            ListTile(
              leading: Icon(Icons.flag_outlined),
              title: Text("Language"),
              trailing: Text("العربية"),
            ),
          ],
        ),
      ),
    );
  }
}
