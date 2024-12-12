import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'herb_details_screen.dart';
import 'categories_screen.dart';

class FrontScreen extends StatefulWidget {
  const FrontScreen({Key? key}) : super(key: key);

  @override
  _FrontScreenState createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen> {
  List<Map<String, dynamic>> allHerbs = [
    {
      'name': 'Aloe Vera',
      'tags': [
        'skin',
        'soothing',
        'burns',
        'anti-inflammatory',
        'hair care',
        'wound healing'
      ],
      'imagePath': 'lib/frontend/assets/images/alo.jpg'
    },
    {
      'name': 'Amla',
      'tags': ['vitamin c', 'immune', 'hair', 'antioxidant', 'detox'],
      'imagePath': 'lib/frontend/assets/images/Amla.jpg'
    },
    {
      'name': 'Turmeric',
      'tags': ['anti-inflammatory', 'skin', 'digestion'],
      'imagePath': 'lib/frontend/assets/images/turmeric.jpg'
    },
    {
      'name': 'Fenugreek',
      'tags': ['hair', 'lactation', 'digestion'],
      'imagePath': 'lib/frontend/assets/images/Fenugreek.jpg'
    },
    {
      'name': 'Kutki',
      'tags': ['liver', 'detox', 'digestion'],
      'imagePath': 'lib/frontend/assets/images/Kutki.jpg'
    },
    {
      'name': 'Ashwagandha',
      'tags': ['stress', 'energy', 'immune'],
      'imagePath': 'lib/frontend/assets/images/Ashwagandha.jpg'
    },
    {
      'name': 'Mexican Mint',
      'tags': ['digestion', 'aroma', 'flavor'],
      'imagePath': 'lib/frontend/assets/images/Mexican_Mint.jpg'
    },
    {
      'name': 'Sarpagandha',
      'tags': ['bp', 'stress', 'anxiety'],
      'imagePath': 'lib/frontend/assets/images/Sarpagandha.jpg'
    },
    {
      'name': 'Jatamansi',
      'tags': ['memory', 'relaxation', 'sleep'],
      'imagePath': 'lib/frontend/assets/images/Jatamansi.jpg'
    },
    {
      'name': 'Brahmi',
      'tags': ['memory', 'focus', 'calm'],
      'imagePath': 'lib/frontend/assets/images/Brahmi.jpg'
    },
    {
      'name': 'Henna',
      'tags': ['hair', 'cooling', 'color'],
      'imagePath': 'lib/frontend/assets/images/Henna.jpg'
    },
  ];

  List<Map<String, dynamic>> filteredHerbs = [];

  @override
  void initState() {
    super.initState();
    filteredHerbs = allHerbs; // Initially show all herbs
  }

  void filterHerbs(String query) {
    setState(() {
      filteredHerbs = allHerbs.where((herb) {
        final herbName = herb['name'].toLowerCase();
        final tags = (herb['tags'] as List<String>).join(' ').toLowerCase();
        return herbName.contains(query.toLowerCase()) ||
            tags.contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7F6D4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE7F6D4),
        elevation: 0,
        title: Text(
          'HerbalHub',
          style: GoogleFonts.lexend(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_outline, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFD7E9B9),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  onChanged: filterHerbs, // Filter herbs on input change
                  decoration: InputDecoration(
                    hintText: 'Search your next herbal discovery...',
                    hintStyle: GoogleFonts.lexend(color: Colors.green[800]),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.green[800]),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CategoriesScreen()),
                        );
                      },
                      child: Icon(Icons.filter_alt, color: Colors.green[800]),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Search Results Section
              Text(
                'Search Results',
                style: GoogleFonts.lexend(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              filteredHerbs.isEmpty
                  ? Center(
                      child: Text(
                        'No herbs match your search!',
                        style: GoogleFonts.lexend(
                            fontSize: 16, color: Colors.black54),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredHerbs.length,
                      itemBuilder: (context, index) {
                        final herb = filteredHerbs[index];
                        return buildPlantCard(
                          herb['name'],
                          herb['imagePath'],
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    HerbDetailsScreen(herbName: herb['name']),
                              ),
                            );
                          },
                          width: double.infinity,
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: const Color.fromARGB(255, 27, 69, 29),
        backgroundColor: const Color(0xFFF0F8EE),
        animationDuration: const Duration(milliseconds: 300),
        items: const <Widget>[
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.camera_alt_outlined, color: Colors.white),
          Icon(Icons.local_florist_outlined, color: Colors.white),
          Icon(Icons.bar_chart_outlined, color: Colors.white),
          Icon(Icons.person_outline, color: Colors.white),
        ],
        onTap: (index) {
          // Handle bottom navigation taps if needed
        },
      ),
    );
  }

  Widget buildPlantCard(String title, String imagePath, VoidCallback onTap,
      {double width = 150}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: PlantCard(
          title: title,
          imagePath: imagePath,
          width: width,
        ),
      ),
    );
  }
}

class PlantCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final double width;

  const PlantCard({
    required this.title,
    required this.imagePath,
    this.width = 150,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.5), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Text(
          title,
          style: GoogleFonts.lexend(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
