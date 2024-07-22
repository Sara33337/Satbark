import 'package:amazon/Models/itemModel.dart';
import 'package:amazon/components/item.dart';
import 'package:amazon/screens/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key, required this.description});

  final String description;

  // final List<ItemModel> Clothes = [
  //   ItemModel(
  //     IMage: "images/items/blouse.jpg",
  //     description: "Blouse",
  //     price: "50\$",
  //   ),
  //   ItemModel(
  //       IMage: "images/items/printedDress.jpg",
  //       description: "Printed Dress",
  //       price: "100\$"),
  //   ItemModel(
  //       IMage: "images/items/slipper.jpg",
  //       description: "Slippers",
  //       price: "20\$"),
  //   ItemModel(
  //       IMage: "images/items/stacks-jeans-clothing-wood.jpg",
  //       description: "Blue Jeans",
  //       price: "60\$"),
  //   ItemModel(
  //       IMage: "images/items/whiteShirt.jpg",
  //       description: "White T-Shirt",
  //       price: "10\$"),
  //   ItemModel(
  //       IMage: "images/items/fashion-shoes-sneakers.jpg",
  //       description: "Sneakers",
  //       price: "100\$")
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(description , 
          style: GoogleFonts.aDLaMDisplay(
            textStyle : (const TextStyle (
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ))
          ),),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection(description).snapshots(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return SizedBox(
                height:MediaQuery.of(context).size.height,
                child: SizedBox(
                  width: 380,
                  child: GridView.builder(
                      physics: const ScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, 
                          childAspectRatio: (120 / 182)),
                      itemCount:  snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                  
                            Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ProductPage(
                                  product: 
                                ItemModel(
                                IMage: snapshot.data!.docs[index]['IMage'],
                                description: snapshot.data!.docs[index]['description'],
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
                                  price: snapshot.data!.docs[index]['price'])),
                        );
                      }),
                ),
              );
            }))
            );
  }
}
