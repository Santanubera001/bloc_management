import 'package:bloc_management/config/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:bloc_management/views/view.dart';
class Routes{
  static Route<dynamic>generateRoutes(RouteSettings setting){
     switch(setting.name){
       case RoutesName.splashScreen:
         return  MaterialPageRoute(builder:(context)=>SplashScreen());
       case RoutesName.homeScreen:
         return  MaterialPageRoute(builder:(context)=>HomeScreen());
       case RoutesName.loginScreen:
         return  MaterialPageRoute(builder:(context)=>LoginScreen());
       default:
         return MaterialPageRoute(builder: (context){
            return const Scaffold(
              body: Center(
                child: Text("No route generate"),
              ),
            );
         });

     }
  }
}