import 'package:amazon/Models/itemModel.dart';
import 'package:amazon/screens/CategoriesPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Category extends StatelessWidget {
  const Category({super.key, required this.category});
  final ItemModel category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CategoriesPage(description: category.description!,);
            }));
          },
          child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10,right: 10),
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(category.IMage!), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(60),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 180, 175, 175),
                        blurRadius: 2,
                      ),
                    ]),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            category.description!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
      ],
    );
  }
}


// child: Column(children: [
            //   Padding(
            //     padding: const EdgeInsets.only(top: 20),
            //     child: Container(
            //       height: 120,
            //       width: 130,
            //       decoration: BoxDecoration(
            //           image: DecorationImage(
            //               image: AssetImage(category.IMage!),
            //               fit: BoxFit.cover)),
            //     ),
            //   ),
            //   Padding(
            //     padding: const EdgeInsets.only(
            //       top: 20,
            //     ),
            //     child: Text(
            //       category.description!,
            //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            //     ),
            //   ),
            //   Padding(
            //     padding: const EdgeInsets.only(top: 10),
            //     child: Text(category.price!,
            //         style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             fontSize: 17,
            //             color: const Color.fromARGB(255, 37, 138, 41))),
            //   ),