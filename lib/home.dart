import 'package:flutter/material.dart';
import 'package:greenvision/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'object_detector_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
          backgroundColor: Colors.teal.shade300,

        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 5, // 20%
              child: Container(child:  Image.asset(
                "assets/newgif.gif",
                height: 125.0,
                width: double.infinity,
              ),),
            ),
            Expanded(
              flex: 4, // 60%
              child: Center(child: Container(padding: const EdgeInsets.symmetric(horizontal: 30),child: const Text('Our app is designed to be easy and intuitive to use, with a clean and user-friendly interface that makes plant identification a breeze. Simply snap a photo of a plant leaf, flower, or stem, and our AI-powered algorithm will instantly analyze the image and provide a match with the closest plant species in our database.'),)),
            ),
            Expanded(
              flex: 2, // 20%
              child: Row(
                children: [
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 25)),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return const ObjectDetectorView();
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal.shade300),
                    child: const Text('Scan'),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal.shade300),
                    child: const Text('Monitor plant health'),
                  ),

                ],
              ),
            )
          ],
        ),
        );
  }
}
