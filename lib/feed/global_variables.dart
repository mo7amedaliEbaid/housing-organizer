import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../addPost/addpost.dart';
import '../home/home.dart';
import '../profile/profile.dart';
import '../search/search.dart';
import '../wishlist/wishlist.dart';


List<Widget> items = [
  HomeScreen(),
  SearchScreen(),
  AddPost(),
  WishListScreen(),
  ProfileScreen(),
];
