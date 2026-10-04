import 'package:bloc_management/repository/auth/login_repository.dart';
import 'package:bloc_management/repository/movies/movies_http_api_repository.dart';
import 'package:bloc_management/repository/movies/movies_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:bloc_management/config/routes/routes.dart';
import 'package:bloc_management/config/routes/routes_name.dart';
import 'package:flutter/material.dart';

GetIt getIt=GetIt.instance;
void main() {
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
     initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoutes,
    );
  }
}

void serviceLocator()
{
  getIt.registerLazySingleton<LoginRepository>(()=>LoginRepository());
  getIt.registerLazySingleton<MoviesRepository>(()=>MoviesHttpApiRepository());
}
