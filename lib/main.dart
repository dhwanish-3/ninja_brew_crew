import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ninja_brew_crew/models/user.dart';
import 'package:ninja_brew_crew/screens/wrapper.dart';
import 'package:ninja_brew_crew/services/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser?>.value(
      // builder: (context)=>AppUser(),
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const Wrapper(),
      ),
    );
  }
}
