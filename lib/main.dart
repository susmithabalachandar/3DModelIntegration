// import 'package:flutter/material.dart';
// import 'frontend/screens/home_screen.dart';
// import 'frontend/screens/role_selection/roleselection_screen.dart';
// import 'frontend/auth/login_screen.dart';
// import 'frontend/auth/professional_registration_screen.dart';
// import 'frontend/screens/front_screen.dart';
// import 'package:herbalhub/frontend/screens/categories_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'HerbalHub',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
//         useMaterial3: true,
//       ),
//       home: const HomeScreen(),
//       routes: {
//         '/roleSelection': (context) => const RoleSelectionScreen(),
//         '/login': (context) => LoginScreen(),
//         '/professionalRegistration': (context) =>
//             ProfessionalRegistrationScreen(),
//         '/frontScreen': (context) => FrontScreen(),
//         '/categoriesScreen': (context) => CategoriesScreen(),
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'frontend/screens/home_screen.dart';
import 'frontend/screens/role_selection/roleselection_screen.dart';
import 'frontend/auth/login_screen.dart';
import 'frontend/auth/professional_registration_screen.dart';
import 'frontend/screens/front_screen.dart';
import 'frontend/screens/categories_screen.dart';
import 'frontend/assets/database/database_helper.dart'; // Ensure this import exists

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure proper initialization
  await DatabaseHelper()
      .database; // Initialize the database to ensure it's ready
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HerbalHub',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      // Set your initial screen
      home: const HomeScreen(),
      routes: {
        '/roleSelection': (context) => const RoleSelectionScreen(),
        '/login': (context) => LoginScreen(),
        '/professionalRegistration': (context) =>
            ProfessionalRegistrationScreen(),
        '/frontScreen': (context) => FrontScreen(),
        '/categoriesScreen': (context) => CategoriesScreen(),
      },
      // Fallback for unknown routes
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(child: Text('Page not found')),
        ),
      ),
    );
  }
}
