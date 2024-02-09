
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'object_detector_view.dart';
import 'onboarding.dart';

class User extends StatelessWidget{
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User'),
          centerTitle: true,
          backgroundColor: Colors.teal.shade300,
          actions: [
            IconButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('showHome', false);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) {
                        return const OnboardingPage();
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.logout)),
          ],
        ),
      body:  Container(
        child: const Text('unused'),
      )
      
    );
  }


}