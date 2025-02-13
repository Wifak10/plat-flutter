import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plat/widgets/category_chip.dart';
import 'package:plat/widgets/recommendation_card.dart';

class BreakfastScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Breakfast Screen'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // TextField pour la recherche
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Pancake',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Section "Category"
            Text(
              'Category',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategoryChip(
                  label: 'Salad',
                  iconPath: 'assets/icons/salad.svg',
                  iconColor: Colors.purple, // Color violet pour "Salad"
                ),
                CategoryChip(
                  label: 'Cake',
                  iconPath: 'assets/icons/pancakes.svg',
                  iconColor: Colors.blue, // Couleur bleue pour "Cake"
                ),
                CategoryChip(
                  label: 'Pie',
                  iconPath: 'assets/icons/pie.svg',
                  iconColor: Colors.purple, // Couleur violette pour "Pie"
                ),
              ],
            ),
            SizedBox(height: 20),

            // Section "Recommendation for Diet"
            Text(
              'Recommendation for Diet',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            RecommendationCard(
              imageUrl: 'assets/icons/plate.svg', // Assurez-vous d'utiliser l'image SVG correcte
              title: 'Pancake',
              details:
                  'Pancake is a flat cake, often thin and round.',
            ),
          ],
        ),
      ),
    );
  }
}
