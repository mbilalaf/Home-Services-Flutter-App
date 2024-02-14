import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:home_services/controllers/auth_controller/signup/signup_controller.dart';

class Validator {
  SignUpController signUpController = SignUpController();

  String? validateFullName(String value) {
    if (value.isEmpty) {
      return "You must fill the Name Field";
    }
    // else if (!GetUtils.isUsername(value)) {
    //   return "Only Alphabets are Allowed";
    // }
    else if (value.length < 3) {
      return "Full Name must be at least more than 2 Characters";
    }
    // Check if the name contains only alphabetic characters and spaces
    else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
      return "Please provide a valid Full Name";
    }

    return null;
    return null;
  }

  String? validateEmail(String value) {
    String val = value.trim();
    if (val.isEmpty) {
      return "You must fill the Email Field";
    } else if (!GetUtils.isEmail(val)) {
      return "Provide a Valid Email";
    }
    return null;
  }

  static bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  static bool isPakistaniPhoneNumber(String s) {
    // Allow formats like 0333-3333333 or 03333333333
    return hasMatch(s, r'^\b03[0-9]{2}-?[0-9]{7}\b$');
  }

  String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return "You must fill the Phone Number Field";
    } else if (!isPakistaniPhoneNumber(value)) {
      return "Provide a Valid Mobile Number";
    }
    return null;
  }

  String? validatePassword(String value) {
    String val = value.trim();
    if (val.isEmpty) {
      return "You must fill the Password Field";
    }
    if (val.length < 6) {
      return "Password Must be greater than 5 characters";
    }
    return null;
  }

  String? validateConfirmPassword(String value, password) {
    String val = value.trim();
    if (val.isEmpty) {
      return "You must fill the Confirm Password Field";
    }
    if (password != value) {
      return "Confirm Password Must be same as Password";
    }
    return null;
  }
}
