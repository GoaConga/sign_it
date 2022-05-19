import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sign_it_in/nav.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final keyApplicationId = 'KKyeejBJ6gk9GOUECesKTIpQVgcOkeIo3JjLGXFh';
  final keyClientKey = 'rZUnyegDpnoQRJ43T5k717BgowBUAM6mdRAhX0Tm';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Bottom Navigation Bar Tutorial',
      home: Nav(),
    );
  }
}
