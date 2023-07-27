import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Container customNavigation({required BuildContext context, required int page}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 24),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      boxShadow: [
        BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20.0,
            color: Color(0xFFDADADA).withOpacity(0.45))
      ],
    ),
    child: SafeArea(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            FontAwesomeIcons.home,
            color:
                page == 0 ? Colors.green.withOpacity(0.5) : Color(0xFFB6B6B6B6),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            FontAwesomeIcons.search,
            color:
                page == 0 ? Colors.green.withOpacity(0.5) : Color(0xFFB6B6B6B6),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/Heart Icon.svg",
              color: page == 1
                  ? Colors.green.withOpacity(0.5)
                  : Color(0xFFB6B6B6B6)),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            FontAwesomeIcons.images,
            color:
                page == 0 ? Colors.green.withOpacity(0.5) : Color(0xFFB6B6B6B6),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/User Icon.svg",
              color: page == 4
                  ? Colors.red.withOpacity(0.5)
                  : Color(0xFFB6B6B6B6)),
        ),
      ],
    )),
  );
}
