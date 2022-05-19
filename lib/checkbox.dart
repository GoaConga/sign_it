import 'package:flutter/material.dart';

class CheckBoxes extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<CheckBoxes> {
  bool? C = false;
  bool? java = false;
  bool? python = false;
  bool? php = false;
  bool? CSS = false;
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Align(
        alignment: Alignment.center,
        child: Container(
            height: 420,
            width: 300,
            decoration: BoxDecoration(
                color: Colors.white60, borderRadius: BorderRadius.circular(10)),
            child: Column(children: [
              CheckboxListTile(
                value: C,
                onChanged: (val) {
                  setState(() {
                    C = val;
                  });
                },
                activeColor: Colors.green,
                title: Text("C"),
                subtitle: Text("Day 1"),
              ),
              Divider(
                height: 20,
                color: Colors.green,
              ),
              CheckboxListTile(
                value: java,
                onChanged: (val) {
                  setState(() {
                    java = val;
                  });
                },
                activeColor: Colors.green,
                title: Text("Java"),
                subtitle: Text("Day 2"),
              ),
              Divider(
                height: 20,
                color: Colors.green,
              ),
              CheckboxListTile(
                value: python,
                onChanged: (val) {
                  setState(() {
                    python = val;
                  });
                },
                activeColor: Colors.green,
                title: Text("Python"),
                subtitle: Text("Day 3"),
              ),
              Divider(
                height: 20,
                color: Colors.green,
              ),
              CheckboxListTile(
                value: php,
                onChanged: (val) {
                  setState(() {
                    php = val;
                  });
                },
                activeColor: Colors.green,
                title: Text("PHP"),
                subtitle: Text("Day 3"),
              ),
              Divider(
                height: 20,
                color: Colors.green,
              ),
              CheckboxListTile(
                value: CSS,
                onChanged: (val) {
                  setState(() {
                    CSS = val;
                  });
                },
                activeColor: Colors.green,
                title: Text("CSS"),
                subtitle: Text("Day 3"),
              ),
              Divider(
                height: 20,
                color: Colors.green,
              ),
            ])),
      )
    ]);
  }
}
