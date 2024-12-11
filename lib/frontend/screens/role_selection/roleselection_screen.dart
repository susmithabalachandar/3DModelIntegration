// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:herbalhub/frontend/config/routes.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.lightGreen[50],
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Welcome to HerbalHub!',
//               style: GoogleFonts.lexend(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Image.asset(
//               'lib/frontend/assets/images/home_page_logo.png',
//               height: 150,
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30.0),
//               child: Text(
//                 'Explore the world of herbal plants with us. Learn about their uses, benefits, and how to grow them. Start your journey to becoming a herbal expert today!',
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.lexend(fontSize: 16),
//               ),
//             ),
//             const SizedBox(height: 30),
//             InkWell(
//               onTap: () {
//                 Navigator.pushNamed(context, Routes.roleSelection);
//               },
//               splashColor: Colors.greenAccent.withOpacity(0.5), // Ripple effect
//               borderRadius: BorderRadius.circular(20),
//               child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 100), // Animation speed
//                 curve: Curves.easeInOut,
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 65, 166, 68),
//                   borderRadius: BorderRadius.circular(20),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.2),
//                       blurRadius: 10,
//                       offset: const Offset(0, 5),
//                     ),
//                   ],
//                 ),
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                 child: Text(
//                   'Get Started',
//                   style: GoogleFonts.lexend(
//                     fontSize: 18,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Text(
//           'HerbalHub ©',
//           textAlign: TextAlign.center,
//           style: GoogleFonts.lexend(color: Colors.grey),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class RoleSelectionScreen extends StatelessWidget {
//   const RoleSelectionScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(''),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   'lib/frontend/assets/images/home_page_logo.png',
//                   height: 100,
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   'Are you a Student or a Professional?',
//                   style: GoogleFonts.lexend(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 20),
//                 Container(
//                   padding: const EdgeInsets.all(16.0),
//                   decoration: BoxDecoration(
//                     color: Colors.green[50],
//                     borderRadius: BorderRadius.circular(17),
//                   ),
//                   child: Column(
//                     children: [
//                       Text(
//                         'If you’re here to expand your knowledge about herbal plants for academic purposes or personal growth, we have curated content just for you!',
//                         textAlign: TextAlign.center,
//                         style: GoogleFonts.lexend(fontSize: 16),
//                       ),
//                       const SizedBox(height: 15),
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.pushNamed(context, '/login');
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.green,
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 28, vertical: 15),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           elevation: 10,
//                           shadowColor: Colors.black.withOpacity(0.5),
//                         ),
//                         child: Text(
//                           'I’m a Student',
//                           style: GoogleFonts.lexend(
//                             fontSize: 16,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Container(
//                   padding: const EdgeInsets.all(16.0),
//                   decoration: BoxDecoration(
//                     color: Colors.green[50],
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Column(
//                     children: [
//                       Text(
//                         'For those with experience in herbal medicine, botany, or related fields, our advanced content is designed to deepen your expertise!',
//                         textAlign: TextAlign.center,
//                         style: GoogleFonts.lexend(fontSize: 16),
//                       ),
//                       const SizedBox(height: 10),
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.pushNamed(context, '/professionalRegistration');
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.green,
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 24, vertical: 12),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           elevation: 10,
//                           shadowColor: Colors.black.withOpacity(0.5),
//                         ),
//                         child: Text(
//                           'I’m a Professional',
//                           style: GoogleFonts.lexend(
//                             fontSize: 16,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/frontend/assets/images/home_page_logo.png',
                  height: 100,
                ),
                const SizedBox(height: 20),
                Text(
                  'Are you a Student or a Professional?',
                  style: GoogleFonts.lexend(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(71, 119, 212, 127),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'If you’re here to expand your knowledge about herbal plants for academic purposes or personal growth, we have curated content just for you!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lexend(fontSize: 16),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 28, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          elevation: 10,
                          shadowColor: Colors.black.withOpacity(0.5),
                        ),
                        child: Text(
                          'I’m a Student',
                          style: GoogleFonts.lexend(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(71, 119, 212, 127),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'For those with experience in herbal medicine, botany, or related fields, our advanced content is designed to deepen your expertise!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lexend(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, '/professionalRegistration');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 10,
                          shadowColor: Colors.black.withOpacity(0.5),
                        ),
                        child: Text(
                          'I’m a Professional',
                          style: GoogleFonts.lexend(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'HerbalHub ©', // Add the copyright symbol here
          textAlign: TextAlign.center,
          style: GoogleFonts.lexend(color: Colors.grey),
        ),
      ),
    );
  }
}
