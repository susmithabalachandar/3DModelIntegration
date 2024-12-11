// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../models/plant_model.dart';
// import 'plant_detail_screen.dart';

// class PlantListScreen extends StatefulWidget {
//   const PlantListScreen({Key? key}) : super(key: key);

//   @override
//   _PlantListScreenState createState() => _PlantListScreenState();
// }

// class _PlantListScreenState extends State<PlantListScreen> {
//   late Future<List<Plant>> _plantsFuture;

//   @override
//   void initState() {
//     super.initState();
//     _plantsFuture = fetchPlants(); // Fetch plants on initialization
//   }

//   Future<List<Plant>> fetchPlants() async {
//     const apiUrl =
//         'http://192.168.67.124:3000/plants'; // Replace with your backend URL
//     final response = await http.get(Uri.parse(apiUrl));

//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       return data.map((json) => Plant.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load plants');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Medicinal Plants")),
//       body: FutureBuilder<List<Plant>>(
//         future: _plantsFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text("No plants available"));
//           }

//           final plants = snapshot.data!;
//           return ListView.builder(
//             itemCount: plants.length,
//             itemBuilder: (context, index) {
//               final plant = plants[index];
//               return ListTile(
//                 leading: Image.network(
//                   plant.imageUrl,
//                   width: 50,
//                   height: 50,
//                   fit: BoxFit.cover,
//                 ),
//                 title: Text(plant.name),
//                 subtitle: Text(plant.botanicalName),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => PlantDetailScreen(plant: plant),
//                     ),
//                   );
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
