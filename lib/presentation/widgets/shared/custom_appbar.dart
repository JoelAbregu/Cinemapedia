import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../delegates/search_movies_delegate.dart';
import '../../providers/providers.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: colors.primary),
              SizedBox(width: 5),
              Text("Cinemapedia", style: titleStyle),
              Spacer(),
              IconButton(
                onPressed: () {
                  final searchedMovies = ref.read(searchedMviesProvider);
                  final searchQuery = ref.read(searchQueryProvider);
                
                  showSearch<Movie?>(
                    query: searchQuery,
                    context: context,
                    delegate: SearchMoviesDelegate(
                      searchMovies: ref.read(searchedMviesProvider.notifier).searchMovieByQuery, initialMovies: searchedMovies
                    )
                  ).then((movie){
                    if (movie == null) return;
                    // ignore: use_build_context_synchronously
                    context.push("/home/0/movie/${movie.id}");
                    
                  });
                  },
                  icon: Icon(Icons.search))
            ],
          ),
        ),
      ),
    );
  }
}
