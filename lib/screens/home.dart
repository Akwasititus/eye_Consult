import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

import 'package:tflite_v2/tflite_v2.dart';

import '../drawer/drawer.dart';

class ImagePickerWidget extends StatefulWidget {
  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _image; // Variable to store the picked image

  String _result = 'Upload Image...';

  void shareResult() {
    Share.share('Results: $_result');
  }

  ZoomDrawerController zoomDrawerController = ZoomDrawerController();

  // Function to open the image picker
  Future<void> _getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(
          source: source); // Pick the image from the specified source
      if (pickedImage != null) {
        // If image was picked successfully, update the state to display the image
        setState(() {
          _image = File(pickedImage.path);
        });
      }
    } catch (e) {
      print(
          'Error picking image: $e'); // Log any error that occurs during image picking
    }
  }

  Future<void> detectGlaucoma() async {
    if (_image == null) return;

    // Run inference using the TensorFlow Lite model
    var recognitions = await Tflite.runModelOnImage(
      path: _image!.path,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 2, // Adjust based on your model's output
      threshold: 0.2, // Adjust based on your model's output
    );

    // Process the inference results
    setState(() {
      _result = recognitions![0]['label'];
    });
  }

  // String modelPath = 'assets/model.tflite';
  // String labelsPath = 'assets/labels.txt';

  Future<void> loadModel() async {
    await Tflite.loadModel(
      model: 'assets/model.tflite',
      labels: 'assets/labels.txt',
    );
  }

  @override
  void initState() {
    super.initState();
    // Load the TensorFlow Lite model and labels
    loadModel();
    detectGlaucoma();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eye Consult'),
        leading: IconButton(
          icon: const Icon(Icons.menu), // Add the drawer icon here
          onPressed: () {
            zoomDrawerController
                .toggle!(); // Open/close the zoomable drawer on icon tap
          },
        ),
      ),
      body: ZoomDrawer(
        controller: zoomDrawerController,
        style: DrawerStyle.defaultStyle,
        borderRadius: 24.0,
        showShadow: false,
        angle: -12.0,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.bounceIn,
        drawerShadowsBackgroundColor: Colors.grey.shade300,
        slideWidth: MediaQuery.of(context).size.width * 0.65,
        menuScreen: const MyYoungDrawer(),
        mainScreen: Column(
          children: [
            const SizedBox(
              height: 20,
            ),

            /// result should be here
            //SelectableText('Name: $name \nconfidence $confidence '),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 150,
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: TextButton(
                    onPressed: () {
                      detectGlaucoma();
                    },
                    child: Text(
                      'Detect Glaucoma',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 50,
                  width: 150,
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: TextButton(
                    onPressed: () {
                      shareResult();
                    },
                    child: Text(
                      'Share Results',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Table(
                border: TableBorder.all(),
                children: [
                  TableRow(children: [
                    TableCell(
                        child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text('Results: $_result', style: TextStyle(fontSize: 20, color: Colors.black),),
                      ),
                    ))
                  ])
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  _image != null ? Image.file(_image!) : Placeholder(),
                ],
              ),
            ),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showBottomSheet(
            context), // Show the bottom sheet when the FAB is pressed
        child: const Icon(Icons.add_a_photo_rounded),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                15.0)), // Set the shape of the bottom sheet with rounded top corners
      ),
      builder: (BuildContext context) {
        return Container(
          child: _buildBottomSheetContent(),
        );
      },
    );
  }

  /// this is a model button sheet
  Widget _buildBottomSheetContent() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Options'),
          _buildRoundedButton(
            'Gallery',
            () {
              _getImage(ImageSource.gallery); // Pick an image from the gallery
              Navigator.pop(
                  context); // Close the bottom sheet after an option is selected
            },
          ),
          const SizedBox(height: 8.0),
          _buildRoundedButton(
            'Camera',
            () {
              _getImage(ImageSource.camera); // Pick an image from the camera
              Navigator.pop(
                  context); // Close the bottom sheet after an option is selected
            },
          ),
        ],
      ),
    );
  }

  /// these are the two widget for the two buttons form Elevated button
  Widget _buildRoundedButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              15.0), // Set the shape of the button with rounded corners
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Text(text),
      ),
    );
  }
}
