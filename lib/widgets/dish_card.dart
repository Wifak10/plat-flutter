import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/category.dart';
import '../models/dish.dart';
import 'package:flip_card/flip_card.dart';
import '../widgets/category_card.dart';
import '../widgets/dish_card.dart';

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
  ];

  // Données fictives pour les plats
  final List<Dish> dishes = [
    Dish(name: 'Honey Pancake', description: 'Easy | 30mins | 180kCal', iconPath: 'icons/honey-pancakes.svg', color: const Color.fromARGB(255, 200, 223, 242)),
    Dish(name: 'Canai Bread', description: 'Easy | 20mins | 230kCal', iconPath: 'icons/canai-bread.svg', color: const Color.fromARGB(255, 243, 189, 226)),
    Dish(name: 'Veggie', description: 'Easy | 30mins | 180kCal', iconPath: 'icons/orange-snacks.svg', color: const Color.fromARGB(255, 162, 209, 247)),
    Dish(name: 'BBQ Chicken', description: 'Easy | 30mins | 180kCal', iconPath: 'icons/blueberry-pancake.svg', color: const Color.fromARGB(255, 224, 194, 215)),
  ];

  List<Category> filteredCategories = [];
  bool hasSearched = false; // Indique si une recherche a été effectuée

  void _logout() {
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
      } else {
        filteredCategories = List.from(categories); // Réafficher toute la liste
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
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  _search(); // Rechercher chaque fois que la valeur change
                },
                decoration: InputDecoration(
                  hintText: "Search categories...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),

            // Titre Category
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Category',
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Liste horizontale des catégories
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: hasSearched ? filteredCategories.length : categories.length,
                itemBuilder: (context, index) {
                  final category = hasSearched ? filteredCategories[index] : categories[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: CategoryCard(
                      category: category,
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
                  fontWeight: FontWeight.w700,
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
                    child: Column(
                      children: [
                        DishCard(
                          dish: dishes[index],
                          onView: () {
                            print("View dish: ${dishes[index].name}");
                          },
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            print("Viewing ${dishes[index].name}");
                            // Ajouter la logique pour afficher plus de détails sur le plat ici
                          },
                          child: const Text("View"),
                        ),
                      ],
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
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
      //     BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      //   ],
      // ),
    );
  }
}

class DishCard extends StatelessWidget {
  final Dish dish;
  final VoidCallback onView;

  const DishCard({
    required this.dish,
    required this.onView,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onView,
      child: FlipCard(
        flipOnTouch: true,
        front: Card(
          color: dish.color,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            width: 160, // Card légèrement agrandi
            height: 270, // Card légèrement agrandi
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: SvgPicture.asset(
                      dish.iconPath,
                      width: 40, // SVG un peu plus petit
                      height: 40,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    dish.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
        back: Card(
          color: dish.color,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            width: 160,
            height: 270,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: SvgPicture.asset(
                      dish.iconPath,
                      width: 40,
                      height: 40,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    dish.description,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
