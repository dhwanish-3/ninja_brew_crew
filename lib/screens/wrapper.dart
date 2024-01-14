import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ninja_brew_crew/screens/authenticate/authenticate.dart';
import 'package:ninja_brew_crew/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<AppUser>(context);
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    debugPrint(user.toString());
    if (user == null) {
      return const Authenticate();
    } else {
      return AppHome();
    }
  }
}
