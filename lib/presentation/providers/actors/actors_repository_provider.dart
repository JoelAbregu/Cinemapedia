import 'package:cinemapedia/insfrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../insfrastructure/datasources/actor_moviedb_datasource.dart';

final actorRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMoviedbDatasource());
});