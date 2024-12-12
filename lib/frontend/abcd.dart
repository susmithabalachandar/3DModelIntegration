import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ModelViewerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3D Model Viewer'),
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: const ModelViewer(
              src: 'assets/models/manjal.glb', // Path to your GLB model
              alt: 'A 3D model of the herb',
              autoRotate: true,
              cameraControls: true,
              backgroundColor: Colors.white,
              animationName: 'default',
            ),
          ),
        ),
      ),
    );
  }
}
