import 'package:cloud_firestore/cloud_firestore.dart';

class UserCreaditials {
  final String? fullname;
  final String?lastName;
  final String? uid;
  final String?email;
  final String?phoneNo;
  final String?address;
  final String?gender;
  final String?age;
  final String?country;
  final String?profilePic;
  // final List cart;
  // creating the constructor here...
  UserCreaditials({
    required this.profilePic,
    required this.email,
    required this.uid,
    required this.fullname,
    required this.lastName,
    required this.phoneNo,
    required this.address,
    required this.gender,
    required this.age,
    required this.country,
    //required this.cart,
  });
  // converting it to the map object
  Map<String, dynamic> toJson() => {
        "profilePic": profilePic,
        "fullName": fullname,
        "lastName": lastName,
        "email": email,
        "uid": uid,
        "address": address,
        "phoneNo": phoneNo,
        "gender": gender,
        "age": age,
        "country": country,
        "cart": [],
      };
  static UserCreaditials fromSnap(DocumentSnapshot documentSnapshot) {
    var snapshot = documentSnapshot.data() as Map<String, dynamic>;
    return UserCreaditials(
      profilePic: snapshot['profilePic'],
      uid: snapshot['uid'],
      email: snapshot['email'],
      fullname: snapshot['fullName'],
      lastName: snapshot['lastName'],
      address: snapshot['address'],
      age: snapshot['age'],
      country: snapshot['country'],
      gender: snapshot['gender'],
      phoneNo: snapshot['phoneNo'],
      // cart: snapshot['cart'],
    );
  }
}
