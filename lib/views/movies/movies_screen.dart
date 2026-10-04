import 'package:bloc_management/bloc/movie_bloc/movies_bloc.dart';
import 'package:bloc_management/config/conponents/internet_Exception.dart';
import 'package:bloc_management/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/enums.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late MoviesBloc moviesBloc;

  @override
  void initState() {
    super.initState();
    moviesBloc = MoviesBloc(moviesRepository: getIt());
  }
  @override
  void dispose(){
    super.dispose();
    moviesBloc.close();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movies Lists")),
      body: BlocProvider(
        create: (_) => moviesBloc..add(MoviesFetched()),
        child: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (BuildContext context, state) {
            switch(state.moviesList.status){
              case Status.loading:
                 return Center(child: CircularProgressIndicator());
              case Status.error:
                if(state.moviesList.message=='No Internet Exception'){
                  return InternetException(onPress:(){
                     moviesBloc.add(MoviesFetched());
                  },);
                }
                return Center(child: Text(state.moviesList.message.toString()),);
              case Status.completed:
                if(state.moviesList.data==null){
                  return Text("No Data Found");
                }
                final movieList=state.moviesList.data!;
                return ListView.builder(
                  itemCount: movieList.tvShows!.length,
                    itemBuilder: (context,index)
                    {
                        final tvShow=movieList.tvShows![index];
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Image(image: NetworkImage(tvShow.imageThumbnailPath.toString())),),
                            title: Text(tvShow.name.toString()),
                            subtitle: Text(tvShow.network.toString()),
                            trailing: Text(tvShow.status.toString()),
                          ),
                        );
                    }
                );
              default:
                return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
