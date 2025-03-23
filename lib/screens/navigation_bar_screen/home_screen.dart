import 'package:flutter/material.dart';
import 'package:soopfood/screens/home_screen_content/home_screen_content.dart';
import 'package:soopfood/screens/navigation_bar_screen/favorites_screen.dart';
import 'package:soopfood/screens/profile/profile_screen.dart';
import 'package:soopfood/screens/navigation_bar_screen/profile_screen.dart';
import 'package:soopfood/screens/navigation_bar_screen/categories_screen.dart';
import 'package:provider/provider.dart';
import '../../provider/latest_recipe_provider.dart';
// import '../home_screen_content/home_screen_content.dart';
import '../../services/auth_service.dart'; // Import AuthService

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0;
  final AuthService _auth = AuthService(); // Add AuthService instance

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LatestRecipeProvider>(context, listen: false)
          .fetchLatestRecipes();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_auth.getCurrentUser() == null) {
      // User is not logged in, redirect to login
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(
            context, '/login'); // Adjust route name as needed
      });
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    List<Widget> widgetOptions = <Widget>[
      HomeScreenContent(searchController: _searchController),
      FavoritesScreen(),
      CategoriesScreen(),
      ProfileScreen(),
    ];

    List<String> titles = ['SoopnFood', 'Favorites', 'Categories', 'Profile'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          titles[_selectedIndex],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pinkAccent, Colors.deepOrange],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 3,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorites'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.pinkAccent,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            elevation: 8,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}
