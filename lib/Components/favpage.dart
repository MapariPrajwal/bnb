import 'package:flutter/material.dart';
class FavoritesScreen extends StatelessWidget {
  final int count;
  final Function() incrementCount;
  final Function() decrementCount;

  const FavoritesScreen({
    super.key, 
    required this.count,
    required this.incrementCount,
    required this.decrementCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Favorites Count: $count'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: incrementCount,
                ),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: decrementCount,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}