import 'package:flutter/material.dart';
import 'package:namer_app/providers/app_state.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favorites = appState.favorites;

    if (favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${favorites.length} favorites:'),
        ),
        for (var i = 0; i < favorites.length; i += 2)
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  child: ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text(favorites[i].asPascalCase),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => appState.removeFavorite(favorites[i]),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: i + 1 < favorites.length
                    ? Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        child: ListTile(
                          leading: Icon(Icons.favorite),
                          title: Text(favorites[i + 1].asPascalCase),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () =>
                                appState.removeFavorite(favorites[i + 1]),
                          ),
                        ),
                      )
                    : SizedBox(),
              ),
            ],
          ),
      ],
    );
  }

}