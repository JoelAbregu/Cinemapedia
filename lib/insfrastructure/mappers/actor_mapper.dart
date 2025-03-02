import 'package:cinemapedia/domain/entities/actor.dart';

import '../models/moviedb/credits_reponse.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
        id: cast.id,
        name: cast.name,
        profilePath: cast.profilePath != null
            ? "https://image.tmdb.org/t/p/w500${cast.profilePath}"
            : "https://static.vecteezy.com/system/resources/previews/009/952/572/non_2x/male-profile-picture-vector.jpg",
        character: cast.character,
      );
}
