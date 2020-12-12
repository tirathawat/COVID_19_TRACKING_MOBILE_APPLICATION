import 'package:covid19_app/models/covid_today_result_world_wide.dart';
import 'package:covid19_app/screens/home_screen/views/components/stat_box.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    getDataWorldWide();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: getDataWorldWide(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var _dataFromWebAPI = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  StatBox(
                    title: "ผู้ติดเชื้อสะสม",
                    total: _dataFromWebAPI.positive,
                    backgroundColor: Color(0xff77007c),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  StatBox(
                    title: "เสียชีวิต",
                    total: _dataFromWebAPI.death,
                    backgroundColor: Color(0xff777777),
                  ),
                ],
              ),
            );
          } else
            return LinearProgressIndicator();
        },
      ),
    );
  }

  Future<CovidTodayResultWorldWide> getDataWorldWide() async {
    var response =
        await http.get("https://api.covidtracking.com/v1/us/current.json");
    var responseBodyNonList = response.body.substring(1, response.body.length - 2);
    return covidTodayResultWorldWideFromJson(responseBodyNonList);
  }
}
