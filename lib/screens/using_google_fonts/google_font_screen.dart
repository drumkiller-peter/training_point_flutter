import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class GoogleFontScreen extends StatelessWidget {
  const GoogleFontScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pushButtonTextStyle = GoogleFonts.poppins(
      textStyle: Theme.of(context).textTheme.headlineMedium,
    );
    final counterTextStyle = GoogleFonts.montserrat(
      fontStyle: FontStyle.italic,
      textStyle: Theme.of(context).textTheme.displayLarge,
    );

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            ''' 
Fundamentals of Flutter UI 1
basic widgets like container, text, button, icon, images, rows, column
multiple child widget like row, column, listview, gridview
''',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            ''' 
Fundamentals of Flutter UI 1
basic widgets like container, text, button, icon, images, rows, column
multiple child widget like row, column, listview, gridview
''',
            style: GoogleFonts.dancingScript(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final ImagePicker picker = ImagePicker();
// Pick an image.
              final XFile? image =
                  await picker.pickImage(source: ImageSource.gallery);
            },
            child: const Text("Pick image"),
          ),
        ],
      ),
    );
  }
}
