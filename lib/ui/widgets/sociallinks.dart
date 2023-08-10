import 'package:flutter/material.dart';
import '../../services/firebase_auth_methods.dart';
import 'customOutlinedbutton.dart';
import 'customSnakeBar.dart';

class SocialLinks extends StatefulWidget {
  const SocialLinks({Key? key}) : super(key: key);

  @override
  State<SocialLinks> createState() => _SocialLinksState();
}

class _SocialLinksState extends State<SocialLinks> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    submitForm() async {
      setState(() {
        loading = true;
      });
      String res =
          await FirebaseAuthMethods().googleSignInOrSignUp(context: context);
      if (res == "success") {
        setState(() {
          loading = false;
        });
        showSnakeBar(res, context);
      } else {
        setState(() {
          loading = false;
        });
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        loading
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.green[900],
                ),
              )
            : customOutLinedBUtton(
                press: () {
                  submitForm();
                },
                imageURl: "assets/icons/google.svg",
              ),
        SizedBox(
          width: 17,
        ),
        customOutLinedBUtton(
          press: () {},
          imageURl: "assets/icons/facebook-2.svg",
        ),
      ],
    );
  }
}
