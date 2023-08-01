import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                if (await Permission.camera.isGranted) {
                  final ImagePicker picker = ImagePicker();
                  // Pick an image.
                  final XFile? image =
                      await picker.pickImage(source: ImageSource.camera);
                  if (image != null) {
                    setState(() {
                      imageFile = File(image.path);
                    });
                  }
                } else {
                  // openAppSettings();
                  await Permission.camera.request();
                }
              },
              child: const Text("Pick image"),
            ),
            if (imageFile != null) Image.file(imageFile!),
          ],
        ));
  }
}
