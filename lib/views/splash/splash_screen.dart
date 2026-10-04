import 'package:bloc_management/config/conponents/internet_Exception.dart';
import 'package:bloc_management/data/exception/app_exception.dart';
import 'package:bloc_management/services/splash/splash_services.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices splashServices=SplashServices();

  @override
  void initState() {
    super.initState();
    splashServices.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:FloatingActionButton(onPressed: (){
      throw NoInternetException("No Internet Exception \n");
      }),
      body: SafeArea(
        child: Center(
          child: Text("Splash Screen"),
          // child: Column(
          //   children: [
          //   InternetException(onPress:(){},)
          //   ],
          // ),
        ),
      ),
    );
  }
}
