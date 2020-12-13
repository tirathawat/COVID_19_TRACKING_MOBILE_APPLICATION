import 'package:covid19_app/screens/start_screen/components/body.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}