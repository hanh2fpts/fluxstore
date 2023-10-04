import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluxstore/app_config/app_config.dart';
import 'package:fluxstore/app_config/text_style_config.dart';

class RateAppPage extends StatefulWidget {
  const RateAppPage({super.key});
  static const String routeName = 'rate_app_page';

  @override
  State<RateAppPage> createState() => _RateAppPageState();
}

class _RateAppPageState extends State<RateAppPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  String imagePath = '';
  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      AppConfig.cameras.first,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Share your feedback',
          style: TextStyleConfig.titleStyle,
        ),
      ),
      body: FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const Text('What is your opinion of Fluxstore?'),
                  const SizedBox(height: 20),
                  RatingBar.builder(
                    initialRating: 4,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  const SizedBox(height: 20),
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        maxLines: 10,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration.collapsed(hintText: "Enter your text here"),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () async {
                      // Take the Picture in a try / catch block. If anything goes wrong,
                      // catch the error.
                      try {
                        // Ensure that the camera is initialized.
                        await _initializeControllerFuture;

                        // Attempt to take a picture and get the file `image`
                        // where it was saved.
                        final image = await _controller.takePicture();

                        if (!mounted) return;

                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DisplayPictureScreen(
                              // Pass the automatically generated path to
                              // the DisplayPictureScreen widget.
                              imagePath: image.path,
                            ),
                          ),
                        );
                      } catch (e) {
                        // If an error occurs, log the error to the console.
                        if (kDebugMode) {
                          print(e);
                        }
                      }
                    },
                    child: Container(
                      width: 69,
                      height: 64,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 2, color: Color(0xFFCCD2E3)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Icon(Icons.camera),
                    ),
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: SizedBox(
                        height: 250,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              const CircleAvatar(
                                child: Icon(Icons.check),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'Thank you for your feedback!',
                                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'We appreciated your feedback.\nWe’ll use your feedback to improve your experience.',
                                textAlign: TextAlign.center,
                              ),
                              const Spacer(),
                              ElevatedButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('Done'))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Text('Send feedback')),
        ),
      ),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}
