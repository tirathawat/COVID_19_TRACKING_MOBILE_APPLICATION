import 'package:covid19_app/components/default_button.dart';
import 'package:covid19_app/screens/sign_in_screen/sign_in_screen.dart';
import 'package:covid19_app/screens/sign_up_screen/sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(50)),
                child: Text(
                  "COVID Tracker",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(36),
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DefaultButton(
                text: "Sign In",
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => SignInScreen()));
                },
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05,),
              DefaultButton(
                text: "Sign Up",
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => SignUpScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}