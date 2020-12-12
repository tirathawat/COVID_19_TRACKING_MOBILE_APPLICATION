import 'package:covid19_app/models/covid_today_result_world_wide.dart';
import 'package:covid19_app/screens/home_screen/views/components/stat_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

import '../../../../../constants.dart';
import '../../../../../size_config.dart';

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
                  Container(
                    margin: EdgeInsets.only(
                      top: getProportionateScreenHeight(10),
                      bottom: getProportionateScreenHeight(10),
                    ),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Statistic",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: getProportionateScreenWidth(32),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Worldwide covid-19 today\nlasted update : ${formatDateFormApi(_dataFromWebAPI.lastModified)}",
                      style: TextStyle(
                        color: kTextColor,
                        fontSize: getProportionateScreenWidth(20),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.05,
                  ),
                  StatBox(
                    title: "ผู้ติดเชื้อสะสม",
                    total: _dataFromWebAPI.positive,
                    backgroundColor: Color(0xfffca949),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.01,
                  ),
                  StatBox(
                    title: "หายแล้ว",
                    total: _dataFromWebAPI.recovered,
                    backgroundColor: Color(0xff2cda66),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.01,
                  ),
                  StatBox(
                    title: "รักษาอยู่ในโรงพยาบาล",
                    total: _dataFromWebAPI.hospitalized,
                    backgroundColor: Color(0xff32a9fd),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.01,
                  ),
                  StatBox(
                    title: "เสียชีวิต",
                    total: _dataFromWebAPI.death,
                    backgroundColor: Color(0xfffb3838),
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
    var responseBodyNonList =
        response.body.substring(1, response.body.length - 2);
    return covidTodayResultWorldWideFromJson(responseBodyNonList);
  }

  String formatDateFormApi(String date) {
    date = date.replaceAll("-", "/");
    date = date.replaceAll("T", "/");
    date = date.replaceAll(":", "/");
    date = date.replaceAll("Z", "/");
    List<String> myDate = date.split("/");
    return "${myDate[0]}/${myDate[1]}/${myDate[2]} ${myDate[3]}:${myDate[4]}";
  }
}
