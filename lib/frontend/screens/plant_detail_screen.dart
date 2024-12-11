// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:audioplayers/audioplayers.dart';
// import '../models/plant_model.dart';

// class PlantDetailScreen extends StatefulWidget {
//   final Plant plant;

//   const PlantDetailScreen({Key? key, required this.plant}) : super(key: key);

//   @override
//   _PlantDetailScreenState createState() => _PlantDetailScreenState();
// }

// class _PlantDetailScreenState extends State<PlantDetailScreen> {
//   late VideoPlayerController videoPlayerController;
//   late AudioPlayer audioPlayer;

//   @override
//   void initState() {
//     super.initState();
//     videoPlayerController = VideoPlayerController.network(widget.plant.videoUrl)
//       ..initialize().then((_) {
//         setState(() {}); // Trigger a rebuild once the video is initialized
//       });
//     audioPlayer = AudioPlayer();
//   }

//   @override
//   void dispose() {
//     videoPlayerController.dispose();
//     audioPlayer.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.plant.name),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Image.network(widget.plant.imageUrl),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(widget.plant.description),
//             ),
//             // Video Player Section
//             if (videoPlayerController.value.isInitialized)
//               AspectRatio(
//                 aspectRatio: videoPlayerController.value.aspectRatio,
//                 child: VideoPlayer(videoPlayerController),
//               )
//             else
//               const CircularProgressIndicator(), // Show loading spinner while the video initializes
//             ElevatedButton(
//               onPressed: () {
//                 if (videoPlayerController.value.isPlaying) {
//                   videoPlayerController.pause();
//                 } else {
//                   videoPlayerController.play();
//                 }
//                 setState(
//                     () {}); // Update the UI to reflect the play/pause state
//               },
//               child: Text(
//                 videoPlayerController.value.isPlaying
//                     ? "Pause Video"
//                     : "Play Video",
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (widget.plant.audioUrl.isNotEmpty) {
//                   audioPlayer.play(UrlSource(widget.plant.audioUrl));
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                         content: Text("No audio available for this plant!")),
//                   );
//                 }
//               },
//               child: Text("Play Audio"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
