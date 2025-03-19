import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/recent_search_provider.dart';
import '../widgets/shimmers/recent_search_shimmer.dart'; // Import shimmer widget

class RecentSearchWidget extends StatelessWidget {
  final Function(String) onSearchTap;

  RecentSearchWidget({required this.onSearchTap});

  @override
  Widget build(BuildContext context) {
    return Consumer<RecentSearchProvider>(
      builder: (context, recentSearchProvider, child) {
        return FutureBuilder<List<String>>(
          future: recentSearchProvider.getRecentSearches(),
          builder: (context, snapshot) {
            // Show shimmer while data is loading
            if (snapshot.connectionState == ConnectionState.waiting) {
              return RecentSearchShimmer(); // Display shimmer effect
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              final recentSearches = snapshot.data!;
              final last10Searches = recentSearches.reversed
                  .take(10)
                  .toList(); // Keep only last 10 searches

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Heading
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Text(
                      'Recent Searches',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),

                  // Left-aligned, scrollable row of chips
                  Container(
                    width: double.infinity, // Ensures alignment to left
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.start, // Align left
                        children: last10Searches.map((search) {
                          return Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: GestureDetector(
                              onTap: () {
                                onSearchTap(search); // Trigger search
                              },
                              child: Chip(
                                label: Text(
                                  search,
                                  style: TextStyle(fontSize: 14),
                                ),
                                backgroundColor: Colors.white,
                                elevation: 3,
                                shadowColor: Colors.grey.withOpacity(0.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                deleteIcon: Icon(Icons.close, size: 18),
                                onDeleted: () async {
                                  await recentSearchProvider
                                      .removeRecentSearch(search);
                                },
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return SizedBox(); // Hide UI if no searches exist
            }
          },
        );
      },
    );
  }
}
