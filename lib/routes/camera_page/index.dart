// A screen that allows users to take a picture using a given camera.
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_oss_aliyun/flutter_oss_aliyun.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  XFile? _imageFile;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  Future<XFile?> _takePicture() async {
    try {
      await _initializeControllerFuture;
      final image = await _controller.takePicture();

      return image;
    } catch (e) {
      print('Error taking picture: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Camera Full Screen')),
      body: Column(
        children: [
          if (_imageFile == null)
            Expanded(
              child: FutureBuilder<void>(
                future: _initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CameraPreview(_controller);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          if (_imageFile != null)
            Expanded(
              child: Image.file(
                File(_imageFile!.path),
                fit: BoxFit.cover,
              ),
            ),
        ],
      ),
      floatingActionButton: (_imageFile == null)
          ? FloatingActionButton(
              onPressed: () async {
                final image = await _takePicture();
                setState(() {
                  _imageFile = image;
                });
              },
              child: const Icon(Icons.camera_alt),
            )
          : FloatingActionButton(
              onPressed: () async {
                // final Response<dynamic> resp = await Client().putObjectFile(
                //   "/Users/aaa.pdf",
                //   fileKey: "aaa.png",
                //   option: PutRequestOption(
                //     onSendProgress: (count, total) {
                //       print("send: count = $count, and total = $total");
                //     },
                //     onReceiveProgress: (count, total) {
                //       print("receive: count = $count, and total = $total");
                //     },
                //     aclModel: AclMode.private,
                //     callback: Callback(
                //       callbackUrl: callbackUrl,
                //       callbackBody:
                //           "{\"mimeType\":\${mimeType}, \"filepath\":\${object},\"size\":\${size},\"bucket\":\${bucket},\"phone\":\${x:phone}}",
                //       callbackVar: {"x:phone": "android"},
                //       calbackBodyType: CalbackBodyType.json,
                //     ),
                //   ),
                // );
              },
              child: const Icon(Icons.save),
            ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      body: Image.file(File(imagePath)),
    );
  }
}
