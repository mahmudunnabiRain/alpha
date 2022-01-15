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
        child: Column(
          children: [
            if(currentUser == null) ... [
              const SignInWithGoogleButton(),
            ] else ... [
              UserProfile(user: currentUser,)
            ]
          ],
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
    return Column(
      children: [
        const SizedBox(height: 20,),
        CircleAvatar(
          radius: 42,
          backgroundColor: context.watch<MainModel>().appColor,
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.pink,
            backgroundImage: NetworkImage(widget.user.photoURL),
          ),
        ),
        const SizedBox(height: 4,),
        Text(
            widget.user.displayName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: context.watch<MainModel>().appColor,
            )
        ),
        const SizedBox(height: 4,),
        const SignOutButton(),
      ],
    );
  }
}


