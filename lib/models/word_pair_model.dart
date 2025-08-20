import 'package:english_words/english_words.dart';

class WordPairModel {
  final WordPair wordPair;

  WordPairModel(this.wordPair);

  String get asPascalCase => wordPair.asPascalCase;
  String get semanticsLabel => "${wordPair.first} ${wordPair.second}";

  factory WordPairModel.random() => WordPairModel(WordPair.random());

  @override
  bool operator ==(Object other) =>
      other is WordPairModel && other.wordPair == wordPair;

  @override
  int get hashCode => wordPair.hashCode;
}