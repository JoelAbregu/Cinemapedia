import 'package:cinemapedia/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/insfrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/insfrastructure/models/moviedb/credits_reponse.dart';
import 'package:dio/dio.dart';

class ActorMoviedbDatasource extends ActorsDatasource {
  final _dio = Dio(
      BaseOptions(baseUrl: 'https://api.themoviedb.org/3', queryParameters: {
    'api_key': Environment.theMovieDbKey,
    'language': 'es-MX',
  }));
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await _dio.get("/movie/$movieId/credits");
    final actorResponse = CreditsResponse.fromJson(response.data);
    List<Actor> actors =
        actorResponse.cast.map((e) => ActorMapper.castToEntity(e)).toList();
    return actors;
  }
}
