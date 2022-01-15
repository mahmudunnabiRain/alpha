import 'package:flutter/material.dart';
import 'package:alpha/components/app_bar.dart';

class CreateAdPage extends StatefulWidget {
  const CreateAdPage({Key? key}) : super(key: key);

  @override
  _CreateAdPageState createState() => _CreateAdPageState();
}

class _CreateAdPageState extends State<CreateAdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.pageAppBar(context, 'Create Ad'),
      body: Container(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: const [
            Text('Create Ad Page', style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
}
