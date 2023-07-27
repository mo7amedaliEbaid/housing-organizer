import 'package:flutter/cupertino.dart';

import '../services/firebase_auth_methods.dart';
import '../models/users.dart';

class UserProviders extends ChangeNotifier {
  UserCreaditials? _users;
  bool isLoading = false;
  final FirebaseAuthMethods _auth = FirebaseAuthMethods();
  // getter of the _users
  UserCreaditials get getUser => _users!;
  Future<void> refreshUser() async {
    print("\n\n\nWorking tree file");
    isLoading = true;
    UserCreaditials userCreaditials = await _auth.getUserDetails();
    _users = userCreaditials;
    print("\n\n\nWorking tree file");
    print(userCreaditials.address);
    isLoading = false;
    notifyListeners();
  }
}
