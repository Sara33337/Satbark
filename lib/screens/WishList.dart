
import 'package:amazon/Models/itemModel.dart';
import 'package:amazon/screens/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});
  static final auth = FirebaseAuth.instance;

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("WhishList",
              style: GoogleFonts.aDLaMDisplay(
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.black),
              )),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Users')
                .doc(WishList.auth.currentUser!.uid)
                .collection('WishList')
                .snapshots(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView.builder(
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
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListTile(
                            leading: Image(
                              image: AssetImage(
                                  snapshot.data!.docs[index]['IMage']),
                            ),
                            title:
                                Text(snapshot.data!.docs[index]['description']),
                            subtitle: Text(
                                snapshot.data!.docs[index]['price'].toString()),
                            trailing: IconButton(
                              onPressed: () {
                        
                              },
                              icon: Icon(Icons.delete_outline),
                            )),
                      ),
                    );
                  });
            })));
  }
}
