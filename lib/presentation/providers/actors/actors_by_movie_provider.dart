import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>((ref) {
  final getActorsByMovie = ref.watch(actorRepositoryProvider).getActorsByMovie;
  return ActorsByMovieNotifier(getActors: getActorsByMovie);
});



/*
  {
    "784541" : <Actor>[],
    "784542" : <Actor>[],
    "784543" : <Actor>[],
    "784544" : <Actor>[],
  }
*/


typedef GetActorCallBack = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorCallBack getActors;

  ActorsByMovieNotifier({required this.getActors}) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;
    final actors = await getActors(movieId);
    state = {...state, movieId: actors};
  }
}
