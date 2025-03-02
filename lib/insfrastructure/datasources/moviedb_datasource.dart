import 'package:cinemapedia/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/insfrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/insfrastructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/insfrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource implements MoviesDatasource {
  final _dio = Dio(
      BaseOptions(baseUrl: 'https://api.themoviedb.org/3', queryParameters: {
    'api_key': Environment.theMovieDbKey,
    'language': 'es-MX',
  }));

  List<Movie> _jsonToMovies(Map<String,dynamic> json){
    final movieDbResponse = MovieDbResponse.fromJson(json);
    final List<Movie> movies = movieDbResponse.results
    .where((movieDb)=>movieDb.posterPath != "no-poster" )
    .map((e){
      return MovieMapper.movieDBToEntity(e);}
      ).toList();
    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await _dio.get('/movie/now_playing');
    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1})async {
    final response = await _dio.get('/movie/popular');
    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await _dio.get('/movie/top_rated');
    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async{
    final response = await _dio.get('/movie/upcoming');
    return _jsonToMovies(response.data);
  }
  
  @override
  Future<Movie> getMovieById( String id ) async{
    final response = await _dio.get('/movie/$id');
    if(response.statusCode != 200)  throw Exception("The $id no funciono");
    final movieDetails = MovieDetails.fromJson(response.data);

    final Movie movie = MovieMapper.movieDetailsToEntity(movieDetails);

    return movie;
  }
  
  @override
  Future<List<Movie>> searchMovies(String query) async{
    if(query.isEmpty) return [];
    final response = await _dio.get('/search/movie',queryParameters: {
      'query': query
    });
    return _jsonToMovies(response.data);
  }
}
