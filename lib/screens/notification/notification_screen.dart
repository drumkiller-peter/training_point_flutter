import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/widgets/user_info_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const imagePath =
        "https://media.istockphoto.com/id/1193994027/photo/cute-boy-outdoors.jpg?s=612x612&w=0&k=20&c=9t0VR6BCwSZk5ciPSuMzrN0gpfDG2lBoCtHsvoBN0vA=";
    List<UserModel> userModelList = [
      UserModel(name: "Manish Karki", imagePath: imagePath),
      UserModel(name: "Umesh Basnet", imagePath: imagePath),
      UserModel(name: "Usha Karki", imagePath: imagePath),
      UserModel(name: "Peter Karki", imagePath: imagePath),
      UserModel(name: "Samrat Karki", imagePath: imagePath),
      UserModel(name: "Samyog Karki", imagePath: imagePath),
    ];
    return Container(
      color: Colors.green,
      // child: ListView(
      //   children: [
      //     Row(
      //       children: const [
      //         CircleAvatar(
      //           radius: 32,
      //           backgroundImage: NetworkImage(
      //               "https://media.istockphoto.com/id/1193994027/photo/cute-boy-outdoors.jpg?s=612x612&w=0&k=20&c=9t0VR6BCwSZk5ciPSuMzrN0gpfDG2lBoCtHsvoBN0vA="),
      //         ),
      //         Text(
      //           "Manish Karki",
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 24,
      //           ),
      //         ),
      //       ],
      //     ),
      //     Row(
      //       children: const [
      //         CircleAvatar(
      //           radius: 32,
      //           backgroundImage: NetworkImage(
      //               "https://media.istockphoto.com/id/1193994027/photo/cute-boy-outdoors.jpg?s=612x612&w=0&k=20&c=9t0VR6BCwSZk5ciPSuMzrN0gpfDG2lBoCtHsvoBN0vA="),
      //         ),
      //         Text(
      //           "Manish Karki",
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 24,
      //           ),
      //         ),
      //       ],
      //     ),
      //     Row(
      //       children: const [
      //         CircleAvatar(
      //           radius: 32,
      //           backgroundImage: NetworkImage(
      //               "https://media.istockphoto.com/id/1193994027/photo/cute-boy-outdoors.jpg?s=612x612&w=0&k=20&c=9t0VR6BCwSZk5ciPSuMzrN0gpfDG2lBoCtHsvoBN0vA="),
      //         ),
      //         Text(
      //           "Manish Karki",
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 24,
      //           ),
      //         ),
      //       ],
      //     ),
      //     Row(
      //       children: const [
      //         CircleAvatar(
      //           radius: 32,
      //           backgroundImage: NetworkImage(
      //               "https://media.istockphoto.com/id/1193994027/photo/cute-boy-outdoors.jpg?s=612x612&w=0&k=20&c=9t0VR6BCwSZk5ciPSuMzrN0gpfDG2lBoCtHsvoBN0vA="),
      //         ),
      //         Text(
      //           "Manish Karki",
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 24,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],

      // ),
      child: ListView.separated(
          itemCount: userModelList.length,
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 12,
            );
          },
          itemBuilder: (context, index) {
            return UserInfoWidget(
              imagePath: userModelList[index].imagePath,
              fullName: userModelList[index].name,
            );
          }),
    );
  }
}

class UserModel {
  final String name;
  final String imagePath;

  UserModel({required this.name, required this.imagePath});
}
