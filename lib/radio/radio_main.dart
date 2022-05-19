import 'dart:html';
import 'package:flutter/material.dart';
import 'package:sign_it_in/nav.dart';
import 'package:sign_it_in/home_screen.dart';
import 'package:sign_it_in/radio/radio_homescreen.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_it_in/radio.dart';
import 'package:sign_it_in/checkbox.dart';

bool show = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('ON_BOARDING') ?? true;
  runApp(Radio_MyApp());
}

class Radio_MyApp extends StatelessWidget {
  const Radio_MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: show ? Radio_IntroScreen() : const Radio_HomeScreen(),
    );
  }
}

class Radio_IntroScreen extends StatelessWidget {
  Radio_IntroScreen({Key? key}) : super(key: key);

  ///Changed a little bit of buttons styling and text for the thumbnail lol
  ///Thanks for coming here :-)
  final List<PageViewModel> pages = [
    PageViewModel(
        decoration: const PageDecoration(
            pageColor: Color.fromARGB(255, 34, 34, 34),
            titleTextStyle: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            )),
        title: 'What Qualification are you looking for?',
        body: 'Please select from the following',
        image: Center(
          child: Image.asset('images/img_sideways.png'),
        ),
        footer: Column(
          children: [
            SizedBox(
              height: 800,
              width: 400,
              child: CheckBoxes(),
            ),
          ],
        ))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color(0xFF8A2387),
              Color(0xFFE94057),
              Color(0xFFF27121),
            ])),
        padding: const EdgeInsets.fromLTRB(12, 80, 12, 12),
        child: IntroductionScreen(
          //color: Colors.black,
          pages: pages,
          dotsDecorator: const DotsDecorator(
            size: Size(15, 15),
            color: Colors.blue,
            activeSize: Size.square(20),
            activeColor: Colors.red,
          ),
          showDoneButton: true,
          done: const Text(
            'Done',
            style: TextStyle(fontSize: 20),
          ),
          showSkipButton: true,
          skip: const Text(
            'Skip',
            style: TextStyle(fontSize: 20),
          ),
          showNextButton: true,
          next: const Icon(
            Icons.arrow_forward,
            size: 25,
          ),
          onDone: () => onDone(context),
          curve: Curves.bounceOut,
        ),
      ),
    ));
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Nav()));
  }
}
