import 'package:alpha/providers/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/src/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: CreateAdButton(),
      ),
    );
  }


}

class CreateAdButton extends StatefulWidget {
  const CreateAdButton({Key? key}) : super(key: key);

  @override
  _CreateAdButtonState createState() => _CreateAdButtonState();
}

class _CreateAdButtonState extends State<CreateAdButton> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Text("Home", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)).tr();
  }
}
