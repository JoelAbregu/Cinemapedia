import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider<String>((ref) {return "";});

final searchedMviesProvider = StateNotifierProvider<SearchedMoviesNotifier,List<Movie>>((ref) {
  final moviesRepository = ref.read( movieRepositoryProvider );
  return SearchedMoviesNotifier(
    searchMovie: moviesRepository.searchMovies, 
    ref: ref
  );
});


typedef SearchMovieCallBack = Future<List<Movie>> Function(String query);

class SearchedMoviesNotifier extends StateNotifier<List<Movie>> {
  final SearchMovieCallBack searchMovie;
  final Ref ref;
  SearchedMoviesNotifier({
    required this.searchMovie,
    required this.ref
  }): super([]);

  Future<List<Movie>> searchMovieByQuery(String query) async{
    final List<Movie> movies = await searchMovie(query);
    ref.read(searchQueryProvider.notifier).update((state)=>query);
    state = movies;
    return movies;
  }

  
}