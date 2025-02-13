import 'package:flutter/material.dart';
import 'package:plat/models/dish.dart';
import 'package:plat/widgets/category_card.dart';
import 'package:plat/widgets/dish_card.dart';
import '../models/category.dart';
// import '../models/dish.dart';
// import '../widgets/search_bar.dart' as custom;
import '../widgets/category_card.dart';
// import '../widgets/dish_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      if (_searchController.text.isEmpty) {
        setState(() {
          hasSearched = false;
          filteredCategories = List.from(categories);
        });
      }
    });
  }

  final TextEditingController _searchController = TextEditingController();

  // Données fictives pour les catégories
  final List<Category> categories = [
    Category(title: 'Salad', iconPath: 'icons/plate.svg', color: const Color.fromARGB(255, 179, 181, 241)),
    Category(title: 'Cake', iconPath: 'icons/honey-pancakes.svg', color: const Color.fromARGB(255, 122, 126, 242)),
    Category(title: 'Pie', iconPath: 'icons/pie.svg', color: const Color.fromARGB(255, 179, 181, 241)),
    Category(title: 'Pancakes', iconPath: 'icons/pancakes.svg', color: const Color.fromARGB(255, 179, 181, 241)),
    Category(title: 'Honey-Pancake', iconPath: 'icons/honey-pancakes.svg', color: const Color.fromARGB(255, 179, 181, 241)),
    // Ajouter d'autres catégories si nécessaire
  ];

 // Données fictives pour les plats
  final List<Dish> dishes = [
    Dish(name: 'Honey Pancake', description: 'Easy | 30mins | 180kCal', iconPath: 'icons/honey-pancakes.svg', color: const Color.fromARGB(255, 200, 223, 242)),
    Dish(name: 'Canai Bread', description: 'Easy | 20mins | 230kCal', iconPath: 'icons/canai-bread.svg', color: const Color.fromARGB(255, 243, 189, 226)),
    Dish(name: 'Veggie', description: 'Easy | 30mins | 180kCal', iconPath: 'icons/orange-snacks.svg', color: const Color.fromARGB(255, 162, 209, 247)),
    Dish(name: 'BBQ Chicken', description: 'Easy | 30mins | 180kCal', iconPath: 'icons/blueberry-pancake.svg', color: const Color.fromARGB(255, 224, 194, 215)),
    // Ajouter d'autres plats si nécessaire
  ];

  List<Category> filteredCategories = [];
  List<Dish> filteredDishes = [];
  bool hasSearched = false; // Indique si une recherche a été effectuée


  void _logout() {
    // Logique de déconnexion ici
    print("Logout");
  }

  // void _search() {
  //   setState(() {
  //     String query = _searchController.text.toLowerCase();
  //     hasSearched = query.isNotEmpty;

  //     if (hasSearched) {
  //       filteredCategories = categories
  //           .where((category) => category.title.toLowerCase().contains(query))
  //           .toList();
  //     } else {
  //       filteredCategories = List.from(categories); // Réafficher toute la liste
  //     }
  //   });
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 233, 231, 231),
        title: const Text('BREAKFAST',
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
            // custom.SearchBar(controller: SearchController(), onSearch: search),
            const SizedBox(height: 40),
            // Titre Category
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Category',
                style: TextStyle(
                  fontSize: 22, 
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700
                  ),
              ),
            ),
            const SizedBox(height: 10),
            // Liste horizontale des catégories
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(), // Ajout d'un effet de rebond
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = hasSearched ? filteredCategories[index] : categories[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: CategoryCard(
                      category: categories[index],
                      onTap: () {
                        print("Tapped on ${categories[index].title}");
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
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
            const SizedBox(height: 15),
            // Liste horizontale des plats
            SizedBox(
              height: 290,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dishes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: DishCard(
                      dish: dishes[index],
                      onView: () {
                        print("View dish: ${dishes[index].name}");
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar avec trois icônes
      // bottomNavigationBar: BottomNavigationBar(
      //   // currentIndex: _selectedIndex,
      //   // onTap: _onItemTapped,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
      //     BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      //   ],
      // ),
    );
  }
}
