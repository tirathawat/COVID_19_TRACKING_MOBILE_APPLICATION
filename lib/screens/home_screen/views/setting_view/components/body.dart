import 'package:covid19_app/screens/contact_us_screen/contact_us_screen.dart';
import 'package:covid19_app/screens/start_screen/start_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: getProportionateScreenHeight(10),
                bottom: getProportionateScreenHeight(10),
              ),
              alignment: Alignment.center,
              child: Text(
                "Setting",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: getProportionateScreenWidth(32),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              color: Colors.grey,
              height: SizeConfig.screenHeight * 0.005,
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.03,
            ),
            ListTile(
              leading: Icon(
                Icons.contact_page,
                color: kPrimaryColor,
                size: getProportionateScreenWidth(30),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => ContactUsScreen(),
                    ));
              },
              title: Text(
                "Contact us",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(20),
                    fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.02,
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: kPrimaryColor,
                size: getProportionateScreenWidth(30),
              ),
              onTap: () {
                googleSignIn.signOut();
                auth.signOut();
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => StartScreen()));
              },
              title: Text(
                "Logout",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(20),
                    fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
