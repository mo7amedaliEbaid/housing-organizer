import 'package:flutter/material.dart';

import '../../widgets/bottomnavigation/bottomappbar.dart';
import '../postDetailedPage/component/body.dart';


class PostDetailedPage extends StatelessWidget {
  final snap;
  PostDetailedPage({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Body(
          snap: snap,
        ),
      ),
      bottomNavigationBar: bottomapp(context: context, snap: snap),
    );
  }
}
