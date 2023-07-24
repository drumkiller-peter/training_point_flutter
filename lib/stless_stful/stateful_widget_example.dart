// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/stless_stful/login_form_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int counter = 0;
//   Color containerColor = Colors.red;
//   bool isTapped = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   counter = counter + 1;
//                   print(counter);
//                 });
//               },
//               child: const Text("Tap here")),
//           Text(
//             counter.toString(),
//             style: const TextStyle(fontSize: 24),
//           ),
//           InkWell(
//             onTap: () {
//               setState(() {
//                 // containerColor = Colors.green;
//                 isTapped = !isTapped;
//               });
//             },
//             child: Container(
//               height: 50,
//               width: double.infinity,
//               // color: containerColor,
//               color: isTapped ? Colors.red : Colors.green,
//             ),
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(
//                 //     builder: (context) {
//                 //       return const LoginScreen();
//                 //     },
//                 //   ),
//                 // );
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const LoginScreen(),
//                   ),
//                 );
//               },
//               child: const Text("GOTO Logi Screen")),
//         ],
//       ),
//     );
//   }
// }
