import 'package:covid19_app/components/form_error.dart';
import 'package:covid19_app/screens/home_screen/home_screen.dart';
import 'package:covid19_app/screens/sign_up_screen/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../components/default_button.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignInAccount googleUser;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenHeight(20),
        ),
        child: Column(
          children: [
            buildEmailFormField(),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            buildPasswordFormField(),
            FormError(
              errors: errors,
            ),
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  auth
                      .signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text)
                      .then((_) {
                    Navigator.pop(context);
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                    return true;
                  }).catchError((e) {
                    errors.clear();
                    switch (e.code) {
                      case "ERROR_WRONG_PASSWORD":
                        setState(() {
                          errors.add(kERROR_WRONG_PASSWORD);
                        });
                        break;
                      case "ERROR_INVALID_EMAIL":
                        setState(() {
                          errors.add(kERROR_INVALID_EMAIL);
                        });
                        break;
                      case "ERROR_USER_NOT_FOUND":
                        setState(() {
                          errors.add(kERROR_USER_NOT_FOUND);
                        });

                        break;
                      case "ERROR_USER_DISABLED":
                        setState(() {
                          errors.add(kERROR_USER_DISABLED);
                        });
                        break;
                      case "ERROR_TOO_MANY_REQUESTS":
                        setState(() {
                          errors.add(kERROR_TOO_MANY_REQUESTS);
                        });
                        break;
                      case "ERROR_OPERATION_NOT_ALLOWED":
                        setState(() {
                          errors.add(kERROR_OPERATION_NOT_ALLOWED);
                        });
                        break;
                      default:
                        setState(() {
                          errors.add(kERROR_UNKNOWN);
                        });
                    }
                    return false;
                  });
                }
              },
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Text(
              "or",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(20),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            SizedBox(
              width: double.infinity,
              height: getProportionateScreenHeight(56),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Color(0xff4185f4),
                onPressed: () async {
                  await signInWithGoogle().whenComplete(() {
                    Navigator.pop(context);
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/Google.svg",
                      height: 30,
                      width: 30,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Text(
                      "Sign in with Google",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      onChanged: (value) {
        setState(() {
          errors.clear();
        });
      },
      controller: passwordController,
      validator: (value) {
        if (value.isEmpty)
          return kPassNullError;
        else if (value.length < 8)
          return kShortPassError;
        else
          return null;
      },
      obscureText: true,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: "Password",
        hintText: "Enter your password",
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      onChanged: (value) {
        setState(() {
          errors.clear();
        });
      },
      controller: emailController,
      validator: (value) {
        if (value.isEmpty)
          return kEmailNullError;
        else if (!emailValidatorRegExp.hasMatch(value)) {
          return kInvalidEmailError;
        } else
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

  Future<bool> signInWithGoogle() async {
    googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    await auth.signInWithCredential(credential);
    return Future.value(true);
  }
}
