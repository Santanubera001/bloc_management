
import 'package:bloc_management/config/app_url.dart';
import 'package:bloc_management/data/network/network_services.dart';
import 'package:bloc_management/models/movies_model/movies_model.dart';
import 'package:bloc_management/repository/movies/movies_repository.dart';

class MoviesHttpApiRepository implements MoviesRepository{

  final _apiServices=NetworkServices();
  @override
  Future<MoviesModel> fetchMoviesList() async{
    final response=await _apiServices.getApi(AppUrl.popularMoviesListEndPoint);
    return MoviesModel.fromJson(response);
  }


}