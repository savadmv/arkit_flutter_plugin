import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ARKitController arkitController;

  @override
  void dispose() {
    arkitController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('ARKit in Flutter'),
            ),
            body: Container(
              child: ARKitSceneView(
                showStatistics: true,
                onARKitViewCreated: onARKitViewCreated,
              ),
            )),
      );

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;

    final material = ARKitMaterial(
      diffuse: ARKitMaterialProperty(
        color: Colors.red,
      ),
    );
    final sphere = ARKitSphere(
      position: const ARKitPosition(0, 0, -0.5),
      materials: [material],
      radius: 0.1,
    );
    this.arkitController.addSphere(sphere);

    final plane = ARKitPlane(
      width: 1,
      height: 1,
      position: const ARKitPosition(0.4, 0.4, -1.5),
      materials: [
        ARKitMaterial(
          diffuse: ARKitMaterialProperty(color: Colors.green),
        )
      ],
    );
    this.arkitController.addPlane(plane);
  }
}
