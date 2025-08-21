import 'package:flutter/material.dart';
import '../models/word_pair_model.dart';

class MyAppState extends ChangeNotifier {
  var current = WordPairModel.random();

  GlobalKey? historyListKey;

  void getNext() {
    history.insert(0, current);
    var animatedList = historyListKey?.currentState as AnimatedListState?;
    animatedList?.insertItem(0);
    current = WordPairModel.random();
    notifyListeners();
  }

  var favorites = <WordPairModel>[];

  var history = <WordPairModel>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }

  void toggleFavoriteOn(WordPairModel pair) {
    if (favorites.contains(pair)) {
      favorites.remove(pair);
    } else {
      favorites.add(pair);
    }
    notifyListeners();
  }

  void removeFavorite(WordPairModel pair) {
    favorites.remove(pair);
    notifyListeners();
  }
}