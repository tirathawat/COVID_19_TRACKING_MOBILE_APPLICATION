import 'package:covid19_app/constants.dart';
import 'package:covid19_app/screens/home_screen/views/setting_view/setting_view.dart';
import 'package:covid19_app/screens/home_screen/views/thailand_covid_view/thailand_covid_view.dart';
import 'package:covid19_app/screens/home_screen/views/world_wide_covid_view/world_wide_covid_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: [
            ThailandCovidView(),
            WorldWideCovidView(),
            SettingView(),
          ],
        ),
        backgroundColor: kPrimaryColor,
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.list),
              text: "test1",
            ),
            Tab(
              icon: Icon(Icons.work),
              text: "test2",
            ),
            Tab(
              icon: Icon(Icons.settings),
              text: "Setting",
            ),
          ],
        ),
      ),
    );
  }
}