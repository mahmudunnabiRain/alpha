import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class CustomAppBar {

  static PreferredSizeWidget homeAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: MediaQuery.of(context).platformBrightness == Brightness.dark ? Colors.black : Colors.white,
      titleSpacing: 0,
      elevation: 0,
      title: Image.asset("assets/images/logo_title.png", height: 20,),
      iconTheme: IconThemeData(color: MediaQuery.of(context).platformBrightness == Brightness.dark ? Colors.white : Colors.black),
    );
  }

  static PreferredSizeWidget pageAppBar(BuildContext context, String title) {
    return AppBar(
      backgroundColor: MediaQuery.of(context).platformBrightness == Brightness.dark ? Colors.black : Colors.white,
      titleSpacing: 0,
      elevation: 0,
      //title: Image.asset("assets/images/logo_title.png", height: 36,),
      title: Text(title, style: TextStyle(
        fontSize: 20 ,
        color: MediaQuery.of(context).platformBrightness == Brightness.dark ? Colors.white : Colors.black,
        fontWeight: FontWeight.w600,
      ),).tr(),
      iconTheme: IconThemeData(color: MediaQuery.of(context).platformBrightness == Brightness.dark ? Colors.white : Colors.black),
    );
  }

}
