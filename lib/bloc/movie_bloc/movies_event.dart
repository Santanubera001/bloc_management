part of 'movies_bloc.dart';

abstract class MoviesEvents extends Equatable{

  @override
  List<Object?> get props => [];
}

class MoviesFetched extends MoviesEvents{}