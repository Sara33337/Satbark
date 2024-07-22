import 'package:amazon/BLogic/FireBase/Auth.dart';
import 'package:amazon/Models/itemModel.dart';
import 'package:amazon/components/Cateogries.dart';
import 'package:amazon/components/item.dart';
import 'package:amazon/screens/CartPage.dart';
import 'package:amazon/screens/ProfilePage.dart';
import 'package:amazon/screens/ShoppingPage.dart';
import 'package:amazon/screens/WishList.dart';
import 'package:amazon/screens/product.dart';
import 'package:amazon/screens/splashScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<ItemModel> Categories = [
    ItemModel(
      IMage: "images/items/Clothes.jpg",
      description: "Clothes",
    ),
    ItemModel(
      IMage: "images/items/running.jpg",
      description: "Shoes",
    ),
    ItemModel(
      IMage: "images/items/belt.jpg",
      description: "Belts",
    ),
    ItemModel(
      IMage: "images/items/blackheels.jpg",
      description: "High heels",
    ),
    ItemModel(
      IMage: "images/items/running.jpg",
      description: "Sneakers",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ProfilePage();
                      }));
                    },
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 100, 94, 94),
                      radius: 25,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 20),
                    child: Text(
          "User Profile",
          style: GoogleFonts.aDLaMDisplay(
          textStyle:  TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Color.fromARGB(255, 100, 94, 94)),)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            ListTile(
              leading: IconButton(onPressed: (){},
              icon: Icon(Icons.settings)),
              title: Text(
                "Settings",
              ),
            ),
            ListTile(
              leading: IconButton(onPressed: (){},
              icon: Icon(Icons.local_shipping_rounded)),
              title: Text(
                "Shipping",
              ),
            ),
            ListTile(
              leading: IconButton(onPressed: (){},
              icon: Icon(Icons.wallet)),
            
              title: Text(
                "Wallet",
              ),
            ),
             ListTile(
                leading: IconButton(onPressed: (){
                    Authentiction.SignOut();
                 if (FirebaseAuth.instance.currentUser == null) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SplashScreen();
                  }));
                }
                },
                icon: Icon(Icons.logout_outlined) ,),
                title: Text(
                  "Log out",
                ),
              
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          "SATBRAK",
          style: GoogleFonts.aDLaMDisplay(
          textStyle: const  TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Color.fromARGB(255, 100, 94, 94)),)),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CartPage();
                }));
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Color.fromARGB(255, 100, 94, 94),
              )),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const WishList();
                }));
              },
              icon: const Icon(
                Icons.favorite_rounded,
                color: Color.fromARGB(255, 100, 94, 94),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: const DecorationImage(
                      image: AssetImage("images/shopping2.jpg"),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 45),
                    child: Container(
                      height: 60,
                      width: 320,
                      decoration: const BoxDecoration(
                         color: Color.fromARGB(255, 231, 222, 222)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                                height: 55,
                                width: 50,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage("images/shopping2.jpg"),
                                        fit: BoxFit.cover))),
                          ),
                          const SizedBox(width: 10,),
                          const Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "START SHOPPING",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 100, 94, 94),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ShoppingPage();
                              }));
                            },
                            child: Container(
                              height: 30,
                              width: 40,
                              color: const Color.fromARGB(255, 100, 94, 94),
                              child: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 59, top: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "The ",
                              style: GoogleFonts.aDLaMDisplay(
                                textStyle : const TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              ),),
                            Text(
                              "Entrta",
                              style: GoogleFonts.aDLaMDisplay(    
                                textStyle :const TextStyle(
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 239, 63, 63),
                                  fontWeight: FontWeight.bold),
                              ),
                              
                            ),
                        
                            Text(
                              "i",
                              style: GoogleFonts.aDLaMDisplay(
                            
                                textStyle : const TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              ),
                              
                            ),
                              Text(
                              "nment ",
                              style: GoogleFonts.aDLaMDisplay(
                            
                                textStyle : const TextStyle(
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 255, 230, 0),
                                  fontWeight: FontWeight.bold),
                              ),
                              
                            ),

                              Text(
                              "Of",
                              style: GoogleFonts.aDLaMDisplay(
                            
                                textStyle :const TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              ),
                              
                            ),
                          ],
                        ),
                        Text(
                              "Shopping",
                              style: GoogleFonts.aDLaMDisplay(
                            
                                textStyle : const TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              ),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          const  Padding(
              padding: EdgeInsets.only(left: 20, top: 30),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Satbrak Top Trends",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(
                height: 280,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("PrimeDeales")
                      .snapshots(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ProductPage(
                                  product: ItemModel(
                                    IMage: snapshot.data!.docs[index]['IMage'],
                                    description: snapshot.data!.docs[index]
                                        ['description'],
                                    price: snapshot.data!.docs[index]['price'],

                                    // size: snapshot.data!.docs[index]['size']
                                  ),
                                );
                              }));
                            },
                            child: Item(
                                model: ItemModel(
                              IMage: snapshot.data!.docs[index]['IMage'],
                              description: snapshot.data!.docs[index]
                                  ['description'],
                              price: snapshot.data!.docs[index]['price'],
                              
                            )));
                      },
                    );
                  }),
                )),
            const Padding(
              padding:  EdgeInsets.only(left: 20, top: 30),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Categories",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {},
                      child: Category(category: Categories[index]));
                },
              ),
            ),
            const Padding(
              padding:  EdgeInsets.only(left: 20, top: 30),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Best Seller",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(
                height: 280,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("BestSeller")
                      .snapshots(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ProductPage(
                                  product: ItemModel(
                                      IMage: snapshot.data!.docs[index]
                                          ['IMage'],
                                      description: snapshot.data!.docs[index]
                                          ['description'],
                                      price: snapshot.data!.docs[index]
                                          ['price']),
                                );
                              }));
                            },
                            child: Item(
                                model: ItemModel(
                                    IMage: snapshot.data!.docs[index]['IMage'],
                                    description: snapshot.data!.docs[index]
                                        ['description'],
                                    price: snapshot.data!.docs[index]
                                        ['price'],
                                       )));
                      },
                    );
                  }),
                )),
              const  SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
