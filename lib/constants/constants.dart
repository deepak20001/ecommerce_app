import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Builder(
      builder: (context) {
        return SizedBox(
          width: 100,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(
                color: Color(0xFFAA27FB),
              ),
              const SizedBox(
                height: 18.0,
              ),
              Container(
                margin: const EdgeInsets.only(left: 7),
                child: const Text("Loading..."),
              ),
            ],
          ),
        );
      },
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

String getMessageFromErrorCode(String errorCode) {
  switch (errorCode) {
    case ("auth/email-already-in-use"):
      {
        return "The email address is already in use.";
      }
    case ("auth/invalid-email"):
      {
        return "The email address is not valid.";
      }
    case ("auth/weak-password"):
      {
        return "The password is not strong enough.";
      }
    case ("auth/wrong-password"):
      {
        return "The password is invalid for the given email, or the account corresponding to the email doesn't have a password set.";
      }
    case ("auth/user-not-found"):
      {
        return "There is no user corresponding to the given email.";
      }
    case ("auth/network-error"):
      {
        return "There was a network error.";
      }
    default:
      return "An unknown error occurred.";
  }
}

bool loginValidation(String email, String password) {
  if(email.isEmpty && password.isEmpty) {
    showMessage("Both Fields are empty");
    return false;
  } else if(email.isEmpty) {
    showMessage("Email is Empty");
    return false;
  } else if(password.isEmpty) {
    showMessage("Password is Empty");
  } 
  return true;
}