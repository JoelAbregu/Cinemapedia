import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  bool isLoading = false;
  bool isLastPage = false;
  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  void loadNextPage() async{
    if( isLastPage || isLoading) return;
    isLoading = true;
    
    final movies = await ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    isLoading = false;

    if(movies.isEmpty){
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMovies = ref.watch(favoriteMoviesProvider).values.toList();

    if(favoriteMovies.isEmpty){
      final colors = Theme.of(context).colorScheme;
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border_sharp,color: colors.primary,size: 60,),
            Text("Ohhh no!!",style: TextStyle(fontSize: 30,color: colors.primary)),
            Text("No tienes peliculas favoritas",style: TextStyle(fontSize: 20,color: Colors.black45)),
            SizedBox(height: 20),
            FilledButton.tonal(
              onPressed: () => context.go("/home/0"), 
              child: Text("Empieza a buscar")
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: MovieMasonry(
        loadNextPage: loadNextPage,
        movies: favoriteMovies
      )
    );
  }
}
