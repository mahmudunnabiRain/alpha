import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:alpha/components/app_bar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.pageAppBar(context, 'Settings'),
      body: Container(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: const [
            SettingTile(),
          ],
        ),
      ),

    );
  }
}


class SettingTile extends StatefulWidget {
  const SettingTile({Key? key,}) : super(key: key);

  @override
  _SettingTileState createState() => _SettingTileState();
}
enum LanguageItems { english, bangla }

class _SettingTileState extends State<SettingTile> {

  LanguageItems? _character = LanguageItems.english;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: const Text('Language', style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),).tr(),
            leading: Icon(Icons.language_rounded, color: MediaQuery.of(context).platformBrightness == Brightness.dark ? Colors.white : Colors.black),
            horizontalTitleGap: 0,
          ),
          ListTile(
            title: const Text('English', style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),),
            leading: Radio<LanguageItems>(
              value: LanguageItems.english,
              groupValue: _character,
              onChanged: (LanguageItems? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('বাংলা', style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),),
            leading: Radio<LanguageItems>(
              value: LanguageItems.bangla,
              groupValue: _character,
              onChanged: (LanguageItems? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
