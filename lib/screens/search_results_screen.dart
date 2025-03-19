import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/recipe_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'recipe_details_screen.dart';

class SearchResultsScreen extends StatefulWidget {
  final String query; // Store the query

  const SearchResultsScreen({Key? key, required this.query}) : super(key: key);

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _searchController.text = widget.query; // ✅ Use query as initial text

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
      _search(widget.query); // ✅ Trigger search immediately
    });
  }

  void _search(String query) {
    if (query.isNotEmpty) {
      Provider.of<RecipeProvider>(context, listen: false)
          .fetchRecipes(query, '', context);
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Results'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              focusNode: _focusNode,
              controller: _searchController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              onSubmitted: (query) {
                _search(query);
              },
              decoration: InputDecoration(
                hintText: 'Search Recipes...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Consumer<RecipeProvider>(
        builder: (context, recipeProvider, child) {
          if (recipeProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (recipeProvider.recipes.isEmpty) {
            return const Center(child: Text('No search results found.'));
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: recipeProvider.recipes.length,
            itemBuilder: (context, index) {
              final recipe = recipeProvider.recipes[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipeDetailsScreen(recipe: recipe),
                    ),
                  );
                },
                child: Card(
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: recipe.strMealThumb,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Container(
                          color: Colors.black.withOpacity(0.5),
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            recipe.strMeal,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
