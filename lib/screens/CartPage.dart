import 'package:amazon/Models/CartItem.dart';
import 'package:amazon/screens/ConfirmPage.dart';
import 'package:amazon/screens/ShoppingPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int totalCart = 0;
  TotalCartPrice() {
    setState(() {
      for (int i = 0; i < Cartitems.length; i++) {
        totalCart = totalCart + Cartitems[i].totalPrice!;
      }
    });
    return totalCart;
  }

  void clearCart() {
    setState(() {
      Cartitems.clear();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    TotalCartPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart",
              style: GoogleFonts.aDLaMDisplay(
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.black),
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                height: 300,
                child: ListView.builder(
                    itemCount: Cartitems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListTile(
                          leading: Image(
                            image: AssetImage(Cartitems[index].IMage!),
                          ),
                          title: Text(Cartitems[index].description!),
                          subtitle: Row(
                            children: [
                              Text("x" + Cartitems[index].Count!.toString()),
                              SizedBox(
                                width: 15,
                              ),
                              Text(Cartitems[index].price!.toString() + "\$"),
                              SizedBox(
                                width: 15,
                              ),
                              Text("T: " +
                                  Cartitems[index].totalPrice!.toString() + "\$"),
                              SizedBox(width: 15,),
                              Text(Cartitems[index].size),
                            ],
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                Cartitems.removeAt(index);
                              });
                            },
                            icon: Icon(Icons.delete_outline),
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 40, right: 40, top: 20, bottom: 20),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 40, left: 40, top: 5, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Order Price :",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(totalCart.toString(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
                child: Divider(),
              ),
              ElevatedButton(
                  onPressed: () {
                    try {
                      if (Cartitems.length == 0) {
                        final snackbar =
                            SnackBar(content: Text("Your Cart is Empty"));
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      } else {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ConfirmPage(
                            OrderPrice: totalCart,
                          );
                        }));
                      
                      }
                        
                    } catch (e) {
                      print(e);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      fixedSize: Size(200, 40)),
                  child: Text(
                    "confirm",
                    style: TextStyle(fontSize: 16),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          clearCart();
                          totalCart = 0;
                        });
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.cancel_outlined,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Cancle",
                            style: TextStyle(fontSize: 17, color: Colors.black),
                          )
                        ],
                      )),
                  SizedBox(height: 20, child: VerticalDivider()),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ShoppingPage();
                        }));
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.repeat,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Return Shopping",
                            style: TextStyle(fontSize: 17, color: Colors.black),
                          )
                        ],
                      )),
                ],
              )
            ],
          ),
        ));
  }
}
