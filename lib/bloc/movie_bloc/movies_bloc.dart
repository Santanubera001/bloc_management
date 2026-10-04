import 'package:bloc/bloc.dart';
import 'package:bloc_management/data/response/api_response.dart';
import 'package:bloc_management/models/movies_model/movies_model.dart';
import 'package:bloc_management/models/user/user_model.dart';
import 'package:bloc_management/repository/movies/movies_repository.dart';
import 'package:equatable/equatable.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesState> {
  MoviesRepository moviesRepository;
  MoviesBloc({required this.moviesRepository}) : super(MoviesState(moviesList: ApiResponse.loading()))
  {
    on<MoviesFetched>(_fetchedMoviesApiList);
  }

  Future<void> _fetchedMoviesApiList(MoviesFetched event,Emitter<MoviesState>emit)async
  {
     await moviesRepository.fetchMoviesList().then((value){
       emit(state.copyWith(moviesList: ApiResponse.complete(value)));
     }).onError((error,stackStrace){
       emit(state.copyWith(moviesList: ApiResponse.error(error.toString())));
     });
  }
}
