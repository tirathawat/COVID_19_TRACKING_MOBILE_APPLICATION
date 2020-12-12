import 'package:covid19_app/components/default_button.dart';
import 'package:covid19_app/size_config.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  get errors => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: getProportionateScreenHeight(10),
                  bottom: getProportionateScreenHeight(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Send Us A Message",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: getProportionateScreenWidth(32),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              buildNameFormField(),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              buildEmailFormField(),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              buildPhoneFormField(),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              buildMessageFormField(),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              DefaultButton(
                text: "Send Message",
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildMessageFormField() => TextFormField(
        maxLines: 5,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "Message",
          hintText: "Enter your message...",
        ),
      );

  TextFormField buildPhoneFormField() => TextFormField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "Phone number",
          hintText: "Enter your phone number",
        ),
      );

  TextFormField buildNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: "Name",
        hintText: "Enter your name",
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      //onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: "Email",
        hintText: "Enter your email",
      ),
    );
  }
}
