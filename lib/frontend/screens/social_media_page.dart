import 'package:flutter/material.dart';

class SocialMediaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFE7F6D4), // Match the background color in the image
      appBar: AppBar(
        backgroundColor: const Color(0xFFE7F6D4),
        elevation: 0,
        title: const Text(
          'HerbalHub',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Handle search action
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
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          socialPost(
            context,
            userName: 'Jane',
            imagePath: 'assets/images/ginger_post.jpeg',
            description: 'Freshen up your day with the cooling power of mint!',
            followedBy: 'sheero',
            followers: '160k',
          ),
          const SizedBox(height: 20),
          socialPost(
            context,
            userName: 'Jane',
            imagePath: 'assets/images/mint_post.jpeg',
            description: 'Freshen up your day with the cooling power of mint!',
            followedBy: 'sheero',
            followers: '160k',
          ),
          const SizedBox(height: 20),
          socialPost(
            context,
            userName: 'Jane',
            imagePath: 'assets/images/plant_post.jpeg',
            description: 'Freshen up your day with the cooling power of mint!',
            followedBy: 'sheero',
            followers: '160k',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Highlight the middle button
        onTap: (index) {
          // Handle navigation to other pages
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.nature_outlined),
            label: 'Social',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget socialPost(
    BuildContext context, {
    required String userName,
    required String imagePath,
    required String description,
    required String followedBy,
    required String followers,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              backgroundImage:
                  AssetImage('assets/images/avatar_placeholder.png'),
            ),
            const SizedBox(width: 10),
            Text(
              userName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            imagePath,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Icon(Icons.favorite_border, color: Colors.black),
            const SizedBox(width: 15),
            Icon(Icons.mode_comment_outlined, color: Colors.black),
            const SizedBox(width: 15),
            Icon(Icons.share_outlined, color: Colors.black),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          'Followed by $followedBy and $followers others',
          style: TextStyle(color: Colors.grey[700]),
        ),
        const SizedBox(height: 5),
        Text(
          description,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
