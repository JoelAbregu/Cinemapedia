import 'package:flutter/material.dart';

import 'package:cinemapedia/presentation/views/views.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = "home-screen";
  final int pageIndex;
  HomeScreen({super.key, required this.pageIndex});

  final viewRoutes = [
    HomeView(),
    SizedBox(),
    FavoritesView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes
      ),
      bottomNavigationBar: CustomBottomNavigator(currentIndex: pageIndex ),
    );
  }
}
