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
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
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
                    press: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildMessageFormField() => TextFormField(
        controller: messageController,
        validator: (value) {
          if (value.isEmpty)
            return kMessageNullError;
          else
            return null;
        },
        maxLines: 3,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "Message",
          hintText: "Enter your message...",
        ),
      );

  TextFormField buildPhoneFormField() => TextFormField(
        controller: phoneController,
        validator: (value) {
          if (value.isEmpty)
            return kPhoneNumberNullError;
          else
            return null;
        },
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "Phone number",
          hintText: "Enter your phone number",
        ),
      );

  TextFormField buildNameFormField() {
    return TextFormField(
      controller: nameController,
      validator: (value) {
        if (value.isEmpty)
          return kNameNullError;
        else
          return "";
      },
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
      controller: emailController,
      validator: (value) {
        if (value.isEmpty)
          return kEmailNullError;
        else if (!emailValidatorRegExp.hasMatch(value))
          return kInvalidEmailError;
        else
          return "";
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
