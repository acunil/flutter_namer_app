import 'package:flutter/material.dart';
import '../pages/generator_page.dart';
import '../pages/favorites_page.dart';

class AppNavigator {
  static const destinations = [
    NavigationRailDestination(
      icon: Icon(Icons.home),
      label: Text('Home'),
    ),
    NavigationRailDestination(
      icon: Icon(Icons.favorite),
      label: Text('Favorites'),
    ),
  ];

  static Widget getPage(int index) {
    switch (index) {
      case 0:
        return GeneratorPage();
      case 1:
        return FavoritesPage();
      default:
        throw UnimplementedError('No widget for index $index');
    }
  }
}