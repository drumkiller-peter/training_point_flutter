import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/using_google_fonts/google_font_screen.dart';
import 'package:flutter_application_1/screens/video_player_example/video_player_screen.dart';

class FilePickerScreen extends StatefulWidget {
  const FilePickerScreen({super.key});

  @override
  State<FilePickerScreen> createState() => _FilePickerScreenState();
}

class _FilePickerScreenState extends State<FilePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("file Picker example"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.video,
              );

              if (result != null) {
                File file = File(result.files.single.path!);
                if (mounted) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoPlayerScreen(videoFile: file),
                    ),
                  );
                }
              } else {
                // User canceled the picker
              }
            },
            child: const Text("Pick a file"),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GoogleFontScreen(),
                ),
              );
            },
            child: const Text("Go to google font screen"),
          ),
        ],
      ),
    );
  }
}
