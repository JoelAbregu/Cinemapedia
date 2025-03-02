import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/insfrastructure/datasources/isar_datasource.dart';
import 'package:cinemapedia/insfrastructure/repositories/local_storage_repository_impl.dart';
 
final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(datasource: IsarDatasource());
});