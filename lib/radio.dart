import 'package:flutter/material.dart';

void main3334() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

enum SingingCharacter { C, Java, Python, PHP, CSS, HTML }

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  SingingCharacter? _character = null;
  SingingCharacter? character = null;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('C'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.C,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        Divider(
          height: 20,
          color: Colors.green,
        ),
        ListTile(
          title: const Text('Java'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.Java,
            groupValue: character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Python'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.Python,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('PHP'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.PHP,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('CSS'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.CSS,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('HTML'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.HTML,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
