import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/insfrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/insfrastructure/repositories/movie_repository_impl.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
});