import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: const Text('Home', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)).tr()
      ),
    );
  }


}
