import 'package:flutter/material.dart';
import 'package:namer_app/providers/app_state.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favorites = appState.favorites;

    if (favorites.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text('No favorites yet.'),
        ),
      );
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth <= 510
            ? 1
            : constraints.maxWidth <= 800 ? 2 : 3;

        return ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Your favorites:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
                mainAxisExtent: 60
              ),
              itemCount: favorites.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                final favorite = favorites[index];
                return Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),  // 5 top + 5 bottom = 10 vertical padding around content.
                    child: ListTile(
                      title: Text(favorite.asPascalCase),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => appState.removeFavorite(favorite),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}