import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class CustomBottomNavigator extends StatelessWidget {
  final int currentIndex;
  const CustomBottomNavigator({super.key, required  this.currentIndex});
  
  void onItemTapped(BuildContext context, int index){
    context.go("/home/$index");
  }

  
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: currentIndex,
      onTap: (value) => onItemTapped(context, value),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "Inicio"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category_outlined),
          label: "Categorias"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: "Favoritos"
        ),
      ],
    );
  }
}