import 'package:amazon/BLogic/FireBase/FireStore.dart';
import 'package:amazon/screens/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RemainingInfo extends StatefulWidget {
  RemainingInfo({Key? key}) : super(key: key);

  @override
  State<RemainingInfo> createState() => _RemainingInfoState();
}

class _RemainingInfoState extends State<RemainingInfo> {
  List<String> list = <String>['Male', 'Female'];
  List<String> list2 = <String>['Egypt', 'Saudi Arabia', 'Morocco'];
  String dropdownValue = "Gender";
  String dropdownValue2 = "Country";

  final FirstName = TextEditingController();
  final SecondName = TextEditingController();
  final PhoneNumber = TextEditingController();
  final Gender = TextEditingController();
  final Country = TextEditingController();
  final Code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body:ListView(
          children: [
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 8, top: 10, bottom: 10),
                  child: Container(
                    width: 160,
                    child: TextField(
                      controller: FirstName,
                      decoration: InputDecoration(
                          labelText: "First Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 15, left: 8, top: 10, bottom: 10),
                  child: Container(
                    width: 160,
                    child: TextField(
                      controller: SecondName,
                      decoration: InputDecoration(
                          labelText: "Second Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 8, top: 10, bottom: 10),
                  child: DropdownMenu<String>(
                    width: 160,
                    controller: Country,
                    inputDecorationTheme: InputDecorationTheme(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                    hintText: 'Egypt',
                    onSelected: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    dropdownMenuEntries:
                        list2.map<DropdownMenuEntry<String>>(
                            (String value) {
                      return DropdownMenuEntry<String>(
                          value: value, label: value);
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 15, top: 10, bottom: 10),
                  child: DropdownMenu<String>(
                    width: 160,
                    controller: Gender,
                    inputDecorationTheme: InputDecorationTheme(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                    hintText: 'Gender',
                    onSelected: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    dropdownMenuEntries:
                        list.map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(
                          value: value, label: value);
                    }).toList(),
                  ),
                ),
              ],
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 20, top: 10, bottom: 10),
                  child: Container(
                    width: 200,
                    child: TextField(
                      controller: PhoneNumber,
                      decoration: InputDecoration(
                          labelText: "Phone Number",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 20, top: 10, bottom: 10),
                  child: Container(
                    width: 100,
                    child: TextField(
                      controller: Code,
                      decoration: InputDecoration(
                          labelText: "Code",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                ),
                
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 25 , right: 25 , top: 25),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Color.fromARGB(255, 177, 17, 17),
                      foregroundColor: Colors.white,
                      fixedSize: Size(200, 50)),
                  onPressed: () {
                    try {
                      FireStore.AddUserInfo
                      (FirstName.text , SecondName.text , PhoneNumber.text , Gender.text , Country.text);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HomePage();
                      }));
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text(
                    "save",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
          ],
        ));
  }
}
