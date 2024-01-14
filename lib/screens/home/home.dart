import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ninja_brew_crew/models/brew.dart';
import 'package:ninja_brew_crew/screens/home/brew_list.dart';
import 'package:ninja_brew_crew/services/databse.dart';
import 'package:provider/provider.dart';
import 'settings_form.dart';

class AppHome extends StatelessWidget {
  AppHome({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _showSettingsPanel(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: const SettingsForm(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>>.value(
      // catchError: (context, error) {
      //   debugPrint(error.toString());
      //   return DatabaseService().brewListFromSnapshot(Stream.empty());
      // },
      initialData: const [],
      value: DatabaseService().brews,
      // create: (context) => DatabaseService(uid: _auth.currentUser!.uid).brews,

      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: const Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              icon: const Icon(Icons.person),
              label: const Text('logout'),
              onPressed: () async {
                await _auth.signOut();
                Navigator.pop(context);
              },
            ),
            TextButton.icon(
              icon: const Icon(Icons.settings),
              label: const Text('settings'),
              onPressed: () => _showSettingsPanel(context),
            )
          ],
        ),
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/coffee_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: const BrewList()),
      ),
    );
  }
}
