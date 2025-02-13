import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: category.color,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          width: 160, // Card légèrement agrandi
          height: 270, // Card légèrement agrandi
          child: Padding(
            padding: const EdgeInsets.all(12.0), // Plus d'espacement à l'intérieur
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Affichage du SVG, réduit un peu
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: SvgPicture.asset(
                    category.iconPath,
                    width: 40, // SVG un peu plus petit
                    height: 40,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 25),
                // Titre de la catégorie
                Text(
                  category.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
