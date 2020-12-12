import 'package:covid19_app/screens/home_screen/views/thailand_covid_view/components/body.dart';
import 'package:flutter/material.dart';

class ThailandCovidView extends StatefulWidget {
  ThailandCovidView({Key key}) : super(key: key);

  @override
  _ThailandCovidViewState createState() => _ThailandCovidViewState();
}

class _ThailandCovidViewState extends State<ThailandCovidView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}