import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/insfrastructure/models/moviedb/movie_details.dart';

import '../models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB movieDb) => Movie(
      adult: movieDb.adult,
      backdropPath: movieDb.backdropPath == ""
          ? "https://img.freepik.com/vector-gratis/ilustracion-concepto-error-404_114360-1811.jpg?t=st=1739645147~exp=1739648747~hmac=7798a53cb44763d0856d79d1a35e85a8a4866004295578506a587076e440b292&w=1060"
          : "https://image.tmdb.org/t/p/w500${movieDb.backdropPath}",
      genreIds: movieDb.genreIds.map((e) => e.toString()).toList(),
      id: movieDb.id,
      originalLanguage: movieDb.originalLanguage,
      originalTitle: movieDb.originalTitle,
      overview: movieDb.overview,
      popularity: movieDb.popularity,
      posterPath: movieDb.posterPath == ""
          ? "https://movienewsletters.net/photos/000000H1.jpg"
          : "https://image.tmdb.org/t/p/w500/${movieDb.posterPath}",
      releaseDate: movieDb.releaseDate != null ? movieDb.releaseDate! : DateTime.now(),
      title: movieDb.title,
      video: movieDb.video,
      voteAverage: movieDb.voteAverage,
      voteCount: movieDb.voteCount);

  static Movie movieDetailsToEntity(MovieDetails movieDb) => Movie(
      adult: movieDb.adult,
      backdropPath: movieDb.backdropPath == ""
          ? "https://img.freepik.com/vector-gratis/ilustracion-concepto-error-404_114360-1811.jpg?t=st=1739645147~exp=1739648747~hmac=7798a53cb44763d0856d79d1a35e85a8a4866004295578506a587076e440b292&w=1060"
          : "https://image.tmdb.org/t/p/w500${movieDb.backdropPath}",
      genreIds: movieDb.genres.map((e) => e.name).toList(),
      id: movieDb.id,
      originalLanguage: movieDb.originalLanguage,
      originalTitle: movieDb.originalTitle,
      overview: movieDb.overview,
      popularity: movieDb.popularity,
      posterPath: movieDb.posterPath == ""
          ? "https://img.freepik.com/vector-gratis/ilustracion-concepto-error-404_114360-1811.jpg?t=st=1739645147~exp=1739648747~hmac=7798a53cb44763d0856d79d1a35e85a8a4866004295578506a587076e440b292&w=1060"
          : "https://image.tmdb.org/t/p/w500/${movieDb.posterPath}",
      releaseDate: movieDb.releaseDate,
      title: movieDb.title,
      video: movieDb.video,
      voteAverage: movieDb.voteAverage,
      voteCount: movieDb.voteCount);
}
