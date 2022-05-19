import 'package:flutter/material.dart';
import 'package:sign_it_in/nav.dart';
import 'package:sign_it_in/guide/guide_homescreen.dart';
import 'package:sign_it_in/internship/internship_main.dart';
import 'package:sign_it_in/intern/intern_main.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool show = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('ON_BOARDING') ?? true;
  runApp(Guide_MyApp());
}

class Guide_MyApp extends StatelessWidget {
  const Guide_MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Material Apps',
      // theme: ThemeData(
      //   primarySwatch: Colors.red,
      // ),
      home: show ? IntroScreen() : const HomeScreen(),
    );
  }
}

class IntroScreen extends StatelessWidget {
  IntroScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
          title: 'Interns For You',
          body:
              'Here you can have whatever description you would like to have, you can type it all in here',
          footer: SizedBox(
            height: 100,
            width: 400,
          ),
          image: Center(
            child: Image.asset(
              'images/img_logo.png',
              fit: BoxFit.cover,
            ),
          )),
      PageViewModel(
          decoration: const PageDecoration(
              pageColor: Color.fromARGB(255, 34, 34, 34),
              titleTextStyle: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              )),
          title: 'Please Choose An Option',
          body: 'Are You...',
          footer: SizedBox(
              height: 800,
              width: 400,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FlatButton(
                      minWidth: 300.0,
                      height: 70.0,
                      onPressed: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => Internship_MyApp()),
                        )
                      },
                      color: Colors.orange,
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        // Replace with a Row for horizontal icon + text
                        children: <Widget>[
                          Image.asset('images/img_intern1a1.png'),
                          Text("Internship")
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FlatButton(
                      minWidth: 300.0,
                      height: 70.0,
                      onPressed: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => Intern_MyApp()),
                        )
                      },
                      color: Colors.orange,
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        // Replace with a Row for horizontal icon + text
                        children: <Widget>[
                          Image.asset('images/img_company1a.png'),
                          Text("Intern")
                        ],
                      ),
                    ),
                  ])),
          image: Center(
              child: Image.asset(
            'images/img_sideways.png',
            fit: BoxFit.cover,
          ))),
    ];

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 34, 34, 34),
          // gradient: LinearGradient(
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight,
          //     colors: [
          //   Color(0xFF8A2387),
          //   Color(0xFFE94057),
          //   Color(0xFFF27121),
          // ])
        ),
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
