import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:alpha/services/firebase_service.dart';
import 'package:provider/src/provider.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: const Text('Search', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)).tr()
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          //context.read<AdService>().createAd("Best House 2", "Dhanmondi", "Dhaka", "house no: 101", "Family", 12000);
        },
        child: const Icon(Icons.search),
        mini: true,
      ),
    );
  }
}
