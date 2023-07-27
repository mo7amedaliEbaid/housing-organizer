import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../db/authentication/firestore_methods.dart';
import '../../models/users.dart';
import '../../provider/userProviders.dart';
import '../../widget/customSnakeBar.dart';
import '../../widget/default.dart';
import '../../widget/imagepicker.dart';
import '../../widget/validator.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _userTitleController = TextEditingController();
  TextEditingController _userLocationController = TextEditingController();
  TextEditingController _userOverViewController = TextEditingController();
  TextEditingController _userPriceController = TextEditingController();
  TextEditingController _userBedsController = TextEditingController();
  TextEditingController _userRoomsController = TextEditingController();
  TextEditingController _userSQrtController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  double priceRangeValue = 0;
  RangeValues _currentRangeValues = const RangeValues(0, 100000);

  Uint8List? _file;

  bool _isloading = false;
// for adding post
  String _houseType = "house";
  String _houseStatus = "For Sale";
  void addPost({
    required final uid,
    required final userName,
    required final contactNumber,
    required final email,
  }) async {
    setState(() {
      _isloading = true;
    });
    try {
      String res = await FirestoreMethods().uploadPost(
        houseStatus: _houseStatus,
        houseType: _houseType,
        file: _file!,
        title: _userTitleController.text,
        uid: uid,
        username: userName,
        location: _userLocationController.text,
        beds: _userBedsController.text,
        overview: _userOverViewController.text,
        price: _userPriceController.text,
        rooms: _userRoomsController.text,
        sqft: _userSQrtController.text,
        contactNumber: contactNumber,
        email: email,
      );
      if (res == "success") {
        setState(() {
          _isloading = false;
        });
        showSnakeBar("The post successfully posted.", context);
        clearPage();
      } else {
        setState(() {
          _isloading = false;
        });
        showSnakeBar(res, context);
      }
    } catch (e) {
      print("\n\n\n\tkoi error\r\r\r\r\r\n");
      print(e);
      showSnakeBar(e.toString(), context);
    }
  }

  clearPage() {
    setState(() {
      _file = null;
      _userTitleController.text = "";
      _userLocationController.text = "";
      _userBedsController.text = "";
      _userOverViewController.text = "";
      _userPriceController.text = "";
      _userRoomsController.text = "";
      _userSQrtController.text = "";
    });
  }

  @override
  void dispose() {
    super.dispose();
    _userBedsController.dispose();
    _userRoomsController.dispose();
    _userLocationController.dispose();
    _userOverViewController.dispose();
    _userPriceController.dispose();
    _userSQrtController.dispose();
    _userTitleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // provider code for gettiing the data from the databsae
    UserCreaditials userCreaditials =
        Provider.of<UserProviders>(context).getUser;
    print(userCreaditials.email);
    print(userCreaditials.phoneNo);
    print(userCreaditials.lastName);
    print(userCreaditials.uid);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
            children: [
              Container(
                  clipBehavior: Clip.antiAlias,
                  width: double.infinity,
                  height: 150.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: _file == null
                      ? Image.asset(
                          "assets/images/eral.jpg",
                          fit: BoxFit.cover,
                        )
                      : CircleAvatar(
                          key: UniqueKey(),
                          backgroundImage: MemoryImage(
                            _file!,
                          ),
                          backgroundColor: Colors.white.withOpacity(0.13),
                          radius: 50,
                        )),
              InkWell(
                onTap: () async {
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                },
                child: Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 28.h),
                    width: 90.w,
                    height: 90.h,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.camera,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    Radio(
                      autofocus: true,
                      value: "house",
                      groupValue: _houseType,
                      onChanged: (String? value) {
                        setState(() {
                          _houseType = value!;
                        });
                      },
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      "House",
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Radio(
                      value: "villa",
                      groupValue: _houseType,
                      onChanged: (String? value) {
                        setState(() {
                          _houseType = value!;
                        });
                      },
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text("Villa"),
                    SizedBox(
                      width: 8.w,
                    ),
                    Radio(
                      value: "apartment",
                      groupValue: _houseType,
                      onChanged: (String? value) {
                        setState(() {
                          _houseType = value!;
                        });
                      },
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text("Apartment"),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    Radio(
                      autofocus: true,
                      value: "For Sale",
                      groupValue: _houseStatus,
                      onChanged: (String? value) {
                        setState(() {
                          _houseStatus = value!;
                        });
                      },
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      "For Sale",
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Radio(
                      value: "Rent",
                      groupValue: _houseStatus,
                      onChanged: (String? value) {
                        setState(() {
                          _houseStatus = value!;
                        });
                      },
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text("Rent"),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormField(
                  validator: requiredField,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  controller: _userTitleController,
                  decoration: InputDecoration(hintText: "Title"),
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  validator: requiredField,
                  controller: _userLocationController,
                  decoration: InputDecoration(hintText: "Location"),
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextFormField(
                  validator: requiredField,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  controller: _userOverViewController,

                  maxLines: 8, //or null
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        gapPadding: 4,
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 3,
                        ),
                      ),
                      hintText: "Enter your overview here"),
                ),
                SizedBox(
                  height: 16.h,
                ),

                // RangeSlider(
                //   values: _currentRangeValues,
                //   min: 0,
                //   max: 100000,
                //   divisions: 100,
                //   labels: RangeLabels(
                //     _currentRangeValues.start.round().toString(),
                //     _currentRangeValues.end.round().toString(),
                //   ),
                //   onChanged: (RangeValues values) {
                //     setState(() {
                //       _currentRangeValues = values;
                //     });
                //   },
                // )

                TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: requiredField,
                  controller: _userPriceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Price"),
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextFormField(
                  validator: requiredField,
                  textInputAction: TextInputAction.next,
                  controller: _userBedsController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Beds"),
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextFormField(
                  validator: requiredField,
                  textInputAction: TextInputAction.next,
                  controller: _userRoomsController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Room"),
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextFormField(
                  validator: requiredField,
                  textInputAction: TextInputAction.next,
                  controller: _userSQrtController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Sqft"),
                ),
                SizedBox(
                  height: 16.h,
                ),
                _isloading
                    ? CupertinoActivityIndicator()
                    : defaultButton(
                        text: "Send",
                        press: () async {
                          if (!_formKey.currentState!.validate()) {
                            // If the form is not valid, display a snackbar. In the real world,

                          } else {
                            print("button clicked");
                            // UserCreaditials? _users;
                            // final FirebaseAuthMethods _auth = FirebaseAuthMethods();
                            // UserCreaditials userCreaditials =
                            //     await _auth.getUserDetails();

                            addPost(
                              uid: userCreaditials.uid,
                              email: userCreaditials.email,
                              userName: userCreaditials.fullname,
                              contactNumber: userCreaditials.phoneNo,
                            );
                          }
                        }),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
