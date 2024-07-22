import 'package:amazon/BLogic/FireBase/FireStore.dart';
import 'package:amazon/Models/CartItem.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmPage extends StatefulWidget {
  ConfirmPage({super.key, required this.OrderPrice});
  final int OrderPrice;

  @override
  State<ConfirmPage> createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  List<String> CountryList = <String>['Egypt'];
  List<String> CityList = <String>['Cairo', 'Alexandria', 'Damietta'];
  String? selectedCity;
  String? selectedCountry;
  String dropdownValue = "";
  final firstName = TextEditingController();
  final SecondName = TextEditingController();
  final PhoneNumber = TextEditingController();
  final Code = TextEditingController();
  final City = TextEditingController();
  final Country = TextEditingController();
  final Address = TextEditingController();

  String Order = '';
  int ShippingFee = 0;
  int TotalOrderPrice = 0;

  Shipping() {
    setState(() {
      if (selectedCity == "Cairo") {
        ShippingFee = 50;
      } else if (selectedCity == "Alexandria") {
        ShippingFee = 60;
      } else if (selectedCity == "Damietta") {
        ShippingFee = 70;
      }
    });
    print(" CIT $selectedCity");
    return ShippingFee;
  }

  ToataOrder() {
    TotalOrderPrice = ShippingFee + widget.OrderPrice;
    print(TotalOrderPrice);
    return TotalOrderPrice;
  }

  showAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Submit"),
      onPressed: () {
        Cartitems.clear();
        TotalOrderPrice = 0;
        FireStore.AddOrder(
          firstName.text + SecondName.text,
          PhoneNumber.text,
          Address.text,
          City.text,
          Country.text,
          Order,
          TotalOrderPrice,
        );

        final snackbar =
         SnackBar(content: Text("Your Order Submitted Successfully (\:"));
          ScaffoldMessenger.of(context).showSnackBar(snackbar);

        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Submit ?"),
      content: Text("Are You Sure ?"),
      actions: [cancelButton, continueButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Shipping();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Checkout ",
              style: GoogleFonts.aDLaMDisplay(
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.black),
              )),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 8, top: 10, bottom: 10),
                  child: Container(
                    width: 160,
                    child: TextField(
                      controller: firstName,
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
                    child: DropdownButton<String>(
                      value: selectedCountry,
                      padding: EdgeInsets.only(right: 40),
                      hint: Text('Country'),
                      borderRadius: BorderRadius.circular(15),
                      items: CountryList.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedCountry = newValue;
                          Shipping();
                        });
                      },
                    )),
                Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 15, top: 10, bottom: 10),
                    child: DropdownButton<String>(
                      value: selectedCity,
                      padding: EdgeInsets.only(left: 40),
                      hint: Text('City'),
                      borderRadius: BorderRadius.circular(15),
                      items: CityList.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedCity = newValue;
                          Shipping();
                        });
                      },
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 10, bottom: 10),
              child: Container(
                width: 330,
                child: TextField(
                  controller: Address,
                  decoration: InputDecoration(
                      labelText: "Address Details",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
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
                      right: 15, left: 20, top: 10, bottom: 10),
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
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
              child: Divider(),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 40, left: 40, top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Subtotal :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(widget.OrderPrice.toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 40, left: 40, top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shipping Fee :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(ShippingFee.toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 40, left: 40, top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Order Price :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(ToataOrder().toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                  onPressed: () {
                    for (var index in Cartitems) {
                      Order = Order +
                          "${index.description!} , " +
                          "\t" +
                          "it's amount = ${index.Count!.toString()} , "
                              "\t" +
                          "TOtal price = ${index.totalPrice!.toString()} ," +
                          "\t" +
                          "size : ${index.size}" +
                          "\n";
                    }

                    showAlertDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    "confirm",
                    style: TextStyle(fontSize: 16),
                  )),
            )
          ],
        ));
  }
}
