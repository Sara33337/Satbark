import 'package:amazon/Models/itemModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  Item(
      {super.key,
      required this.model});
  final ItemModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
      child: Container(
          width: 170,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 248, 247, 247),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                    color: const Color.fromARGB(255, 180, 175, 175),
                    blurRadius: 2)
              ]),
          
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Container(
                height: 172,
                width: 170,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(model.IMage!), fit: BoxFit.cover)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Text(
                model.description!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(model.price!.toString() + " \$",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color:Colors.black)),
                  ),
                
                  
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.add_shopping_cart_sharp),
                      ),
                  
                
                ],
              ),
            ),
            
          ])),
    );
  }
}
