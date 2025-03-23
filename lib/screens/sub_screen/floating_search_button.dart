import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/recipe_provider.dart';
import 'search_results_screen.dart';

class FloatingSearchButton extends StatefulWidget {
  final TextEditingController searchController;

  const FloatingSearchButton({super.key, required this.searchController});

  @override
  _FloatingSearchButtonState createState() => _FloatingSearchButtonState();
}

class _FloatingSearchButtonState extends State<FloatingSearchButton> {
  bool _isSearchOverlayVisible = false;
  final _textFieldFocusNode = FocusNode();

  @override
  void dispose() {
    _textFieldFocusNode.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    if (_isSearchOverlayVisible) {
      setState(() {
        _isSearchOverlayVisible = false;
      });
      FocusScope.of(context).unfocus();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Stack(
        children: [
          Positioned(
            bottom: 60,
            right: 16,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isSearchOverlayVisible = true;
                });
                _textFieldFocusNode.requestFocus();
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pinkAccent.withOpacity(0.6),
                      blurRadius: 15,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.pinkAccent,
                  child:
                      const Icon(Icons.search, color: Colors.white, size: 28),
                ),
              ),
            ),
          ),
          if (_isSearchOverlayVisible)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: TextField(
                    focusNode: _textFieldFocusNode,
                    controller: widget.searchController,
                    decoration: InputDecoration(
                      hintText: 'Search recipes...',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onSubmitted: (query) {
                      if (_textFieldFocusNode.hasFocus) {
                        Provider.of<RecipeProvider>(context, listen: false)
                            .fetchRecipes(query, '', context);
                        setState(() {
                          _isSearchOverlayVisible = false;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SearchResultsScreen(query: query),
                          ),
                        );
                        setState(() {
                          _isSearchOverlayVisible = false;
                        });
                      }
                    },
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
