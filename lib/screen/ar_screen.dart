import 'package:camera/camera.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:vector_math/vector_math_64.dart';

class ARScreen extends StatefulWidget {
  final String name;
  final String description;
  final String arObject;

  ARScreen(
      {required this.name, required this.description, required this.arObject});

  @override
  _ARScreenState createState() => _ARScreenState();
}

class _ARScreenState extends State<ARScreen> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  late ARObject _arObject;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _arObject = ARObject(
      title: widget.name,
      description: widget.description,
      modelPath: widget.arObject,
      scale: Vector3(10.0, 10.0, 10.0),
    );
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      final firstCamera = cameras.first;
      _controller = CameraController(
        firstCamera,
        ResolutionPreset.high,
      );
      _initializeControllerFuture = _controller?.initialize();
      setState(() {});
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_arObject.title),
        centerTitle: true,
        backgroundColor: material.Colors.black.withOpacity(0.8),
        titleTextStyle: material.TextStyle(
          color: material.Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Stack(
        children: [
          if (_controller != null && _initializeControllerFuture != null)
            FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_controller!);
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  padding: EdgeInsets.all(16.0),
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    color: material.Colors.black.withOpacity(
                        0.6), 
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    border: Border.all(
                      color: material.Colors.white, 
                      width: 2.0,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      _arObject.description,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: material.Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 2.0,
                            color: material.Colors.black.withOpacity(0.8),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Cube(
                    onSceneCreated: (Scene scene) {
                      scene.world.add(Object(
                        fileName: _arObject.modelPath,
                        scale: _arObject.scale,
                      ));
                      scene.camera.zoom = 10;
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ARObject {
  final String title;
  final String description;
  final String modelPath;
  final Vector3 scale;

  ARObject({
    required this.title,
    required this.description,
    required this.modelPath,
    required this.scale,
  });
}
