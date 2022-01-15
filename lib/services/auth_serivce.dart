import 'package:easy_localization/src/public_ext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/src/provider.dart';

class AuthService {
  final FirebaseAuth _fireBaseAuth;
  final GoogleSignIn _googleSignIn;
  AuthService(this._fireBaseAuth, this._googleSignIn);

  Stream<User?> authStateChanges() {
    return _fireBaseAuth.authStateChanges();
  }

  FirebaseAuth getInstance() {
    return _fireBaseAuth;
  }

  String currentUserName() {
    var currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      return currentUser.displayName!;
    }
    return "No User";

  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await _fireBaseAuth.signInWithCredential(credential);
  }


  Future<String> signIn(String email, String password) async {
    try{
      await _fireBaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return "Signed In";
    } on FirebaseAuthException catch(e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
      else {
        return "SignIn Failed for unknown reason";
      }
    }
  }

  Future<String> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _fireBaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return "SignIn Failed for unknown reason";
      }
    }
  }

  Future<User?> currentUser() async {
    return _fireBaseAuth.currentUser!;
  }

  Future<void> signOut() async {
    await _fireBaseAuth.signOut().then( (_) {
      _googleSignIn.signOut();
    });
  }

}

class SignInWithGoogleButton extends StatefulWidget {
  const SignInWithGoogleButton({Key? key}) : super(key: key);

  @override
  _SignInWithGoogleButtonState createState() => _SignInWithGoogleButtonState();
}

class _SignInWithGoogleButtonState extends State<SignInWithGoogleButton> {



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: context.read<AuthService>().getInstance().authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        // if(snapshot.connectionState == ConnectionState.none) {
        //   return const CircularProgressIndicator();
        // }
        if(snapshot.connectionState == ConnectionState.waiting) {
          print('wait-----$snapshot.connectionState');
          return const CircularProgressIndicator();
        } else {
          return ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
              //minimumSize: const Size(double.infinity, 50)
            ),
            icon: Image.asset("assets/images/google_logo.png", width: 26, height: 26,),
            label: const Text('Sign in with Google', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)).tr(),
            onPressed: () {
              context.read<AuthService>().signInWithGoogle();
            },
          );
        }
      },
    );
  }
}

class SignOutButton extends StatefulWidget {
  const SignOutButton({Key? key}) : super(key: key);

  @override
  _SignOutButtonState createState() => _SignOutButtonState();
}

class _SignOutButtonState extends State<SignOutButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Sign Out', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)).tr(),
      onPressed: () {
        context.read<AuthService>().signOut();
      },
    );
  }
}

