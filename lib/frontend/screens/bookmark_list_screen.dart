import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'herb_details_screen.dart'; // Import HerbDetailsScreen to navigate

class BookmarkListScreen extends StatefulWidget {
  const BookmarkListScreen({Key? key}) : super(key: key);

  @override
  _BookmarkListScreenState createState() => _BookmarkListScreenState();
}

class _BookmarkListScreenState extends State<BookmarkListScreen> {
  List<Map<String, dynamic>> bookmarkedPlants =
      []; // List to store bookmarked plants

  @override
  void initState() {
    super.initState();
    fetchBookmarkedPlants(); // Fetch bookmarked plants on initialization
  }

  // Fetch bookmarked plants from SharedPreferences
  Future<void> fetchBookmarkedPlants() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> bookmarkedPlantsJson =
        prefs.getStringList('bookmarkedHerbs') ?? [];

    setState(() {
      bookmarkedPlants = bookmarkedPlantsJson
          .map((e) => Map<String, dynamic>.from(json.decode(e)))
          .toList();
    });
  }

  // Remove a bookmark from SharedPreferences
  Future<void> removeBookmark(String herbName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> bookmarkedHerbs = prefs.getStringList('bookmarkedHerbs') ?? [];

    // Remove the plant with the given name
    bookmarkedHerbs.removeWhere((element) =>
        Map<String, dynamic>.from(json.decode(element))['name'] == herbName);
    await prefs.setStringList('bookmarkedHerbs', bookmarkedHerbs);

    // Update the local state
    setState(() {
      bookmarkedPlants.removeWhere((element) => element['name'] == herbName);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$herbName removed from bookmarks'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarked Herbs'),
        backgroundColor: const Color(0xFFE7F6D4),
        elevation: 0,
      ),
      body: bookmarkedPlants.isEmpty
          ? const Center(
              child: Text(
                'No bookmarks yet!',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            )
          : ListView.builder(
              itemCount: bookmarkedPlants.length,
              itemBuilder: (context, index) {
                final plant = bookmarkedPlants[index];
                return ListTile(
                  title: Text(
                    plant['name'] ?? 'Unknown Plant',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(plant['medicinalUses'] ?? 'No medicinal uses'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => removeBookmark(plant['name']),
                  ),
                  onTap: () {
                    // Navigate to HerbDetailsScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HerbDetailsScreen(
                          herbName: plant['name'],
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
