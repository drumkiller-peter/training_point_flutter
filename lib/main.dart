import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/file_picker_example/file_picker_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // home: const LoginScreen(),
      // home: const HomeScreen(
      //   userName: '',
      // ),
      home: const FilePickerScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyFirstWidget extends StatefulWidget {
  const MyFirstWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<MyFirstWidget> createState() => _MyFirstWidgetState();
}

class _MyFirstWidgetState extends State<MyFirstWidget> {
  @override
  void initState() {
    // TODO: implement initState
    print("I am init State");
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   print("I am didChangeDependencies called");
  // }

  // @override
  // void didUpdateWidget(oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   print('i am didUpdateWidget called');
  // }

  @override
  void dispose() {
    print("I am dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: const Icon(Icons.arrow_back),
        actions: [
          const Icon(Icons.settings),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              print("Hello i am notification tapped");
            },
            child: const Icon(Icons.notification_add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("I am first child"),
            const Icon(Icons.account_balance),
            Container(
              color: Colors.redAccent.withOpacity(0.4),
              height: 200,
              width: 200,
              child: const Center(
                child: Text(
                  "Hello i am child of container",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print("I am pressed");
                setState(() {});
              },
              child: const Text("Click me"),
            ),
            GestureDetector(
              onTap: () {
                print("I am single tapped");
              },
              onDoubleTap: () {
                print("I am double tapped");
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Continue with Google",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
            Image.asset('assets/images/car.jpeg'),
            const SizedBox(
              height: 40,
            ),
            Image.network(
              "https://www.bentleymotors.com/content/dam/bentley/Master/homepage%20carousel/1920x1080_bentayga_ewb_2.jpg/_jcr_content/renditions/original.image_file.700.394.file/1920x1080_bentayga_ewb_2.jpg",
              height: 300,
              width: 400,
              fit: BoxFit.fill,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                color: Colors.pinkAccent,
              ),
              child: const Text("Buy now"),
            ),
          ],
        ),
      ),
    );
  }
}
