import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNameNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kMessageNullError = "Please Enter your message";

const String kERROR_WRONG_PASSWORD = "Wrong Password! Try again";
const String kERROR_INVALID_EMAIL = "Email is not correct!, Try again";
const String kERROR_USER_NOT_FOUND = "User not found! Register first!";
const String kERROR_USER_DISABLED = "User has been disabled!, Try again";
const String kERROR_TOO_MANY_REQUESTS = "Sign in disabled due to too many requests from this user!, Try again";
const String kERROR_OPERATION_NOT_ALLOWED = "Operation not allowed!, Please enable it in the firebase console";
const String kERROR_UNKNOWN = "Unknown error";