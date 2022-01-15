import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class PinsTab extends StatefulWidget {
  const PinsTab({Key? key}) : super(key: key);

  @override
  _PinsTabState createState() => _PinsTabState();
}

class _PinsTabState extends State<PinsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: const Text('Pins', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)).tr()
      ),
    );
  }
}
