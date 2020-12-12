import 'package:covid19_app/models/covid_today_result_thailand.dart';
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
    getDataThailand();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: getDataThailand(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var _dataFromWebAPI = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  StatBox(
                    title: "ผู้ติดเชื้อสะสม",
                    total: _dataFromWebAPI.confirmed,
                    backgroundColor: Color(0xff77007c),
                  ),
                  SizedBox(height: 10,),
                  StatBox(
                    title: "หายแล้ว",
                    total: _dataFromWebAPI.recovered,
                    backgroundColor: Color(0xff036233),
                  ),
                  SizedBox(height: 10,),
                  StatBox(
                    title: "รักษาอยู่ในโรงพยาบาล",
                    total: _dataFromWebAPI.hospitalized,
                    backgroundColor: Color(0xff00B4B4),
                  ),
                  SizedBox(height: 10,),
                  StatBox(
                    title: "เสียชีวิต",
                    total: _dataFromWebAPI.deaths,
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

  Future<CovidTodayResultThailand> getDataThailand() async {
    var response = await http.get("https://covid19.th-stat.com/api/open/today");
    return covidTodayResultThailandFromJson(response.body);
  }
}
