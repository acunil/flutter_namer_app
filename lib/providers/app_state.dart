import 'package:flutter/material.dart';
import '../models/word_pair_model.dart';

class MyAppState extends ChangeNotifier {
  var current = WordPairModel.random();

  void getNext() {
    current = WordPairModel.random();
    notifyListeners();
  }

  var favorites = <WordPairModel>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }

  void removeFavorite(WordPairModel pair) {
    favorites.remove(pair);
    notifyListeners();
  }
}