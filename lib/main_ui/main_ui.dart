import 'package:flutter/material.dart';
import 'package:alpha/components/app_bar.dart';
import 'package:alpha/main_ui/tabs/home_tab/home.dart';
import 'package:alpha/main_ui/tabs/pins_tab/pins.dart';
import 'package:alpha/main_ui/tabs/profile_tab/profile.dart';
import 'package:alpha/main_ui/tabs/search_tab/search.dart';
import 'package:alpha/providers/main_provider.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class MainUi extends StatefulWidget {
  const MainUi({Key? key}) : super(key: key);

  @override
  _MainUiState createState() => _MainUiState();
}

class _MainUiState extends State<MainUi> {

  @override
  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    homeTab = const HomeTab();
    searchTab = const SearchTab();
    pinsTab = const PinsTab();
    profileTab = const ProfileTab();
  }

  // bottomNavigation
  late HomeTab homeTab;
  late SearchTab searchTab;
  late PinsTab pinsTab;
  late ProfileTab profileTab;

  void _onItemTapped(int index) {
    context.read<MainModel>().changeTabIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.homeAppBar(context),
        drawerScrimColor: Colors.transparent,
        drawer: Container(
          padding: const EdgeInsets.only(top: 91),
          child: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: const EdgeInsets.all(2),
              children: [

                Card(
                  child: SizedBox(
                    height: 200,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              context.watch<MainModel>().appName,
                              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w500)
                          ).tr(),
                          const SizedBox(height: 10,),
                          const Text(
                              'slogan',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)
                          ).tr(),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.settings, color: MediaQuery.of(context).platformBrightness == Brightness.dark ? Colors.white : Colors.black,),
                    title: const Text('Settings', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),).tr(),
                    horizontalTitleGap: 0,
                    onTap: () async {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                      Navigator.of(context).pushNamed('/settings');
                    },

                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.language_rounded, color: MediaQuery.of(context).platformBrightness == Brightness.dark ? Colors.white : Colors.black),
                    title: const Text('Change Language', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),).tr(),
                    horizontalTitleGap: 0,
                    onTap: () async {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      //Navigator.pop(context);
                      if(context.locale == const Locale('en', 'US')) {
                        await context.setLocale(context.supportedLocales[1]);
                      } else {
                        await context.setLocale(context.supportedLocales[0]);
                      }
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.info, color: MediaQuery.of(context).platformBrightness == Brightness.dark ? Colors.white : Colors.black),
                    title: const Text('about_app', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),).tr(),
                    horizontalTitleGap: 0,
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                      Navigator.of(context).pushNamed('/test');
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
        body: IndexedStack(
          index: context.watch<MainModel>().tabIndex,
          children: [
            homeTab,
            searchTab,
            pinsTab,
            profileTab,
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_rounded),
              label: 'Home'.tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.screen_search_desktop_rounded),
              label: 'Search'.tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.bookmark),
              label: 'Pins'.tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.account_box_rounded),
              label: 'Profile'.tr(),
            ),
          ],
          currentIndex: context.watch<MainModel>().tabIndex,
          onTap: _onItemTapped,
        )
    );
  }
}