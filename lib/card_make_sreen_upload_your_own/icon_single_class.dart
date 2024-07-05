
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconWidgetBuilder {
  static Widget buildIcon(IconData icon, double size, {Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        icon,
        color: Colors.black,
        size: size,
      ),
    );
  }

  static Widget buildVerticalLine() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Container(
        width: 1,
        height: double.infinity,
        color: Colors.grey,
      ),
    );
  }

  static Widget buildText(String text, {double fontSize = 16}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w900,
        fontFamily: 'cambria',
      ),
    );
  }

  static Widget buildSvgIcon(String path, double width, double height) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: SvgPicture.asset(
        path,
        width: width,
        height: height,
      ),
    );
  }
}
