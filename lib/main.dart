import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:greenvision/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboarding.dart';
import 'front.dart';
import 'object_detector_view.dart';


List<CameraDescription> cameras = [];
Future main() async{

  WidgetsFlutterBinding.ensureInitialized();
  final prefs =await SharedPreferences.getInstance();
  final showHome =prefs.getBool('showHome')?? false;
  cameras = await availableCameras();
  runApp(MyApp(showHome:showHome));
}

class MyApp extends StatefulWidget {

  final bool showHome;

  const MyApp({Key? key,required this.showHome}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,

      home: widget.showHome? const Front(): const OnboardingPage(),
    );
  }
}