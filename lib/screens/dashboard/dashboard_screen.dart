import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return PageView(
    //   children: [
    //     Image.asset("assets/images/car.jpeg"),
    //     Image.asset("assets/images/car2.webp"),
    //     Image.asset("assets/images/car.jpeg"),
    //     Image.asset("assets/images/car2.webp"),
    //     Image.asset("assets/images/car.jpeg"),
    //     Image.asset("assets/images/car2.webp"),
    //     Image.asset("assets/images/car.jpeg"),
    //     Image.asset("assets/images/car2.webp"),
    //     Image.asset("assets/images/car.jpeg"),
    //     Image.asset("assets/images/car2.webp"),
    //     Image.asset("assets/images/car.jpeg"),
    //     Image.asset("assets/images/car2.webp"),
    //   ],
    // );

    var imageList = [
      "assets/images/car2.webp",
      "assets/images/car.jpeg",
      "assets/images/car.jpeg",
      "assets/images/car.jpeg",
      "assets/images/car.jpeg",
      "assets/images/car.jpeg",
    ];

    return PageView.builder(
        scrollDirection: Axis.vertical,
        onPageChanged: (value) {
          print("Page Changed $value");
          if (value == 0) {
            print("The car is black");
          }
        },
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                imageList[index],
                fit: BoxFit.fill,
              ),
              Positioned(
                bottom: 24,
                // top: 0,
                // right: 0,
                left: 16,
                child: Row(
                  children: const [
                    CircleAvatar(
                      radius: 32,
                      backgroundImage: NetworkImage(
                          "https://media.istockphoto.com/id/1193994027/photo/cute-boy-outdoors.jpg?s=612x612&w=0&k=20&c=9t0VR6BCwSZk5ciPSuMzrN0gpfDG2lBoCtHsvoBN0vA="),
                    ),
                    Text(
                      "Manish Karki",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }
}
