import 'package:bloc_management/models/movies_model/movies_model.dart';

abstract class MoviesRepository{
  Future<MoviesModel> fetchMoviesList();
}