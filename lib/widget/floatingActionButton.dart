import 'package:flutter/material.dart';

import 'customSnakeBar.dart';

class FloatingAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 70),
          child: FloatingActionButton(
            onPressed: () {
              print('click en botton');
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => showSnakeBar("Clicked", context)),
              );
            },
            child: Icon(Icons.queue),
            backgroundColor: Colors.red,
          ),
        ),
      ],
    );
  }
}
