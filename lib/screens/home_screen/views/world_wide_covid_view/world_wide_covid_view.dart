import 'package:covid19_app/screens/home_screen/views/world_wide_covid_view/components/body.dart';
import 'package:flutter/material.dart';

class WorldWideCovidView extends StatelessWidget {
  const WorldWideCovidView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}