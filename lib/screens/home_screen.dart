import 'package:flutter/material.dart';
import 'package:plat/models/dish.dart';
import 'package:plat/widgets/category_card.dart';
import 'package:plat/widgets/dish_card.dart';
import '../models/category.dart';
import '../widgets/search_bar.dart' as custom;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  // Données fictives pour les catégories
  final List<Category> categories = [
    Category(
        title: 'Salad',
        iconPath: 'icons/plate.svg',
        color: const Color.fromARGB(255, 179, 181, 241)),
    Category(
        title: 'Cake',
        iconPath: 'icons/honey-pancakes.svg',
        color: const Color.fromARGB(255, 122, 126, 242)),
    Category(
        title: 'Pie',
        iconPath: 'icons/pie.svg',
        color: const Color.fromARGB(255, 179, 181, 241)),
    Category(
        title: 'Pancakes',
        iconPath: 'icons/pancakes.svg',
        color: const Color.fromARGB(255, 179, 181, 241)),
    Category(
        title: 'Honey-Pancake',
        iconPath: 'icons/honey-pancakes.svg',
        color: const Color.fromARGB(255, 179, 181, 241)),
  ];

  // Données fictives pour les plats
  final List<Dish> dishes = [
    Dish(
        name: 'Honey Pancake',
        description: 'Easy | 30mins | 180kCal',
        iconPath: 'icons/honey-pancakes.svg',
        color: const Color.fromARGB(255, 200, 223, 242)),
    Dish(
        name: 'Canai Bread',
        description: 'Easy | 20mins | 230kCal',
        iconPath: 'icons/canai-bread.svg',
        color: const Color.fromARGB(255, 243, 189, 226)),
    Dish(
        name: 'Veggie',
        description: 'Easy | 30mins | 180kCal',
        iconPath: 'icons/orange-snacks.svg',
        color: const Color.fromARGB(255, 162, 209, 247)),
    Dish(
        name: 'BBQ Chicken',
        description: 'Easy | 30mins | 180kCal',
        iconPath: 'icons/blueberry-pancake.svg',
        color: const Color.fromARGB(255, 224, 194, 215)),
  ];

  List<Category> filteredCategories = [];
  List<Dish> filteredDishes = [];
  bool hasSearched = false; // Indique si une recherche a été effectuée

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      if (_searchController.text.isEmpty) {
        setState(() {
          hasSearched = false;
          filteredCategories = List.from(categories);
          filteredDishes =
              List.from(dishes); // Réinitialiser la liste des plats
        });
      }
    });
  }

  void _logout() {
    // Logique de déconnexion ici
    print("Logout");
  }

  void _search() {
    setState(() {
      String query = _searchController.text.toLowerCase();
      hasSearched = query.isNotEmpty;

      if (hasSearched) {
        filteredCategories = categories
            .where((category) => category.title.toLowerCase().contains(query))
            .toList();

        filteredDishes = dishes
            .where((dish) => dish.name.toLowerCase().contains(query))
            .toList();
      } else {
        filteredCategories =
            List.from(categories); // Réafficher toutes les catégories
        filteredDishes = List.from(dishes); // Réafficher tous les plats
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 233, 231, 231),
        title: const Text(
          'BREAKFAST',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: "Poppins",
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Barre de recherche avec bouton
            custom.SearchBar(controller: _searchController, onSearch: _search),
            const SizedBox(height: 40),
            // Titre Category
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Category',
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 10),
            // Liste horizontale des catégories
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics:
                    const BouncingScrollPhysics(), // Ajout d'un effet de rebond
                itemCount: filteredCategories
                    .length, // Affiche les catégories filtrées
                itemBuilder: (context, index) {
                  final category = filteredCategories[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: CategoryCard(
                      category: category,
                      onTap: () {
                        print("Tapped on ${category.title}");
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            // Titre Dishes
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Recommandations de plats',
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 15),
            // Liste horizontale des plats
            SizedBox(
              height: 290,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filteredDishes.length, // Affiche les plats filtrés
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: DishCard(
                      dish: filteredDishes[index],
                      onView: () {
                        print("View dish: ${filteredDishes[index].name}");
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
