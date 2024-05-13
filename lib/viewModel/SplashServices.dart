import 'dart:async';

import 'package:carparts_app_project/views/Auth/loginView.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginView(),
        ),
        (route) => false,
      );
    });
  }
}
