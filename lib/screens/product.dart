import 'package:amazon/BLogic/FireBase/FireStore.dart';
import 'package:amazon/Models/CartItem.dart';
import 'package:amazon/Models/itemModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.product});
  final ItemModel product;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

int productcounter = 1;
String size = '';

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productcounter = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.product.IMage!),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 25, top: 35),
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 231, 222, 222),
                        radius: 15,
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 200, top: 35, right: 25),
                    
                        child: IconButton(
                        onPressed: (){
                          FireStore.AddToWishList(
                          widget.product.IMage!,
                          widget.product.description!,
                          widget.product.price!);
                        },
                        icon:Icon(
                          Icons.favorite,
                          size: 33,
                          color: Colors.red,
                        ) ,)
                         ),
                  
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 25),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.product.description!,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.product.price!.toString() + "\$",
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  )),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 25),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "select size",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(
              height: 55,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 5),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            size = 'XS';
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 231, 222, 222),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                              child: Text(
                            "XS",
                            style: TextStyle(fontSize: 15),
                          )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            size = 'S';
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 231, 222, 222),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                              child: Text(
                            "S",
                            style: TextStyle(fontSize: 15),
                          )),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          size = 'M';
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 231, 222, 222),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text(
                            'M',
                            style: const TextStyle(fontSize: 15),
                          )),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          size = 'L';
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 231, 222, 222),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text(
                            "L",
                            style: const TextStyle(fontSize: 15),
                          )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            size = 'XL';
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 231, 222, 222),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                              child: Text(
                            "XL",
                            style: TextStyle(fontSize: 15),
                          )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            size = '2XL';
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 231, 222, 222),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text(
                            "2XL",
                            style: TextStyle(fontSize: 15),
                          )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            size = '3XL';
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 231, 222, 222),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text(
                            "3XL",
                            style: TextStyle(fontSize: 15),
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 231, 222, 222),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: GestureDetector(
                                onTap: () {
                                  dec();
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Text(
                                    "-",
                                    style: TextStyle(fontSize: 20),
                                  )),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text("$productcounter",
                                  style: TextStyle(fontSize: 15)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: GestureDetector(
                                onTap: () {
                                  inc();
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Text(
                                    "+",
                                    style: TextStyle(fontSize: 16),
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      try {
                        if (productcounter <= 0 || size.length <= 0) {
                          final snackBar = SnackBar(
                            content: const Text('Select )\:'),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          Cartitems.add(CartItem(
                              widget.product.IMage,
                              widget.product.description,
                              widget.product.price,
                              productcounter,
                              widget.product.price! * productcounter,
                              size));
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Color.fromARGB(255, 177, 17, 17),
                        foregroundColor: Colors.white,
                        fixedSize: Size(200, 50)),
                    child: Row(
                      children: [
                        Icon(Icons.shopping_cart_checkout),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Add To Cart",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  inc() {
    setState(() {
      productcounter++;
    });
  }

  dec() {
    setState(() {
      productcounter--;
    });
  }
}
