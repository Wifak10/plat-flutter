import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;

  const SearchBar({super.key, required this.controller, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    // Utilisation d'IntrinsicHeight pour que le bouton et le TextField aient la même hauteur
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Search Pancake',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                filled: true,
                fillColor: Colors.white, // Fond blanc pour la barre de recherche
              ),
              
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: onSearch,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            ),
            child: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
