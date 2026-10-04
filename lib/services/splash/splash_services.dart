import 'dart:async';

import 'package:bloc_management/config/routes/routes_name.dart';
import 'package:bloc_management/views/login/login_screen.dart';
import 'package:flutter/material.dart';

import '../../views/movies/movies_screen.dart';

class SplashServices{

  void isLogin(BuildContext context)
  {
     Timer( const Duration(seconds: 3),()=>Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => MoviesScreen())));

  }
}