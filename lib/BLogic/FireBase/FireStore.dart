import 'package:amazon/Models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStore {
  static final auth = FirebaseAuth.instance;

  static Future<void> Add(
      String FirstName, String SecondName, String PhoneNumber) async {
    await FirebaseFirestore.instance.collection("Users").add(
        {'FName': FirstName, 'SName': SecondName, 'PhNumber': PhoneNumber});

    print("added");
  }

  static Future<void> AddUserInfo(String FirstName, String SecondName,
      String PhoneNumber, String Gender, String Country) async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(auth.currentUser!.uid)
        .set({
      'FName': FirstName,
      'SName': SecondName,
      'PhNumber': PhoneNumber,
      'Gender': Gender,
      'Country': Country
    });

    print("added");
  }

  static Future<UserModel> GestUserInfo() async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(auth.currentUser!.uid)
        .get()
        .then((value) {
      if (value.exists) {
        UserModel user = UserModel(
            Country: value.data()!['Country'],
            FName: value.data()!['FName'],
            SName: value.data()!['SName'],
            Gender: value.data()!['Gender'],
            PhNumber: value.data()!['PhNumber']);
        print(user.FName);

        return user;
      } else {
        print("No Data");
        return UserModel();
      }
    });
    return UserModel();
  }

  static Future<void> AddToWishList(
      String IMage, String ItemDescription, int Price) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(auth.currentUser!.uid)
        .collection('WishList')
        .add({'IMage': IMage, 'description': ItemDescription, 'price': Price});
  }

  static Future<void> RemoveFromWishList() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(auth.currentUser!.uid)
        .collection('WishList')
        .doc()
        .delete();
  }

  static Future<void> AddOrder(
      String FullNmae,
      String PhoneNumber,
      String AddressDtails,
      String City,
      String Country,
      String Order,
      int TotalPrice,
  ) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(auth.currentUser!.uid)
        .collection('Orders')
        .add({
      'FullName': FullNmae,
      'PhoneNumber': PhoneNumber,
      'City': City,
      'Country': Country,
      'order': Order,
      'Total Price': TotalPrice,
      
    });
  }
}
