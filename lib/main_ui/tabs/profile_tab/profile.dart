import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:alpha/providers/main_provider.dart';
import 'package:alpha/services/auth_serivce.dart';
import 'package:provider/src/provider.dart';

class ProfileTab extends StatefulWidget {

  const ProfileTab({Key? key}) : super(key: key);

  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {

  var currentUser;

  @override
  void initState() {
    context.read<AuthService>().authStateChanges().listen((User? user) {
      if(user == null) {
        setState(() {
          currentUser = null;
        });
      } else {
        setState(() {
          currentUser = user;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: context.read<AuthService>().getInstance().authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              return currentUser == null? const SignInWithGoogleButton(): UserProfile(user: currentUser,);
            }
          },
        ),
      ),
    );
  }
}


class UserProfile extends StatefulWidget {

  final user;
  const UserProfile({Key? key, this.user}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 42,
                    backgroundColor: context.watch<MainModel>().appColor,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: context.watch<MainModel>().appColor,
                      backgroundImage: NetworkImage(widget.user.photoURL),
                    ),
                  ),
                  const SizedBox(height: 4,),
                  Text(
                      widget.user.displayName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: context.watch<MainModel>().appColor,
                      )
                  ),
                  const SizedBox(height: 4,),
                  Text(
                      widget.user.email,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: context.watch<MainModel>().appColor,
                      )
                  ),
                  const SizedBox(height: 4),
                  const SignOutButton(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: InkWell(
                    splashColor: Colors.black45,
                    onTap: () {
                      Navigator.of(context).pushNamed('/createAd');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Icon(Icons.add_box_sharp, size: 30, color: Theme.of(context).colorScheme.secondary),
                          const SizedBox(height: 6),
                          const Text(
                              'Create Ad',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)
                          ).tr(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: InkWell(
                    splashColor: Colors.black45,
                    onTap: () {
                      debugPrint('Card tapped.');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Icon(Icons.list_alt_sharp, size: 30, color: Theme.of(context).colorScheme.secondary),
                          const SizedBox(height: 6),
                          const Text(
                              'My Ads',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)
                          ).tr(),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}


