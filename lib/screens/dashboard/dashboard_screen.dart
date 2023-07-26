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
              PopupMenuButton(
                offset: const Offset(12, 0),
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                      child: Text("Item 1"),
                    ),
                    const PopupMenuItem(
                      child: Text("Item 2"),
                    ),
                    const PopupMenuItem(
                      child: Text("Item 3"),
                    ),
                  ];
                },
                icon: const Icon(Icons.more_vert),
              ),
              Positioned(
                bottom: 24,
                // top: 0,
                // right: 0,
                left: 16,
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        isDismissible: false,
                        builder: (context) {
                          return Column(
                            children: [
                              ListTile(
                                tileColor: Colors.amberAccent,
                                leading: const Icon(Icons.home),
                                title: const Text("Home"),
                                subtitle: const Text(
                                    "When you click me, this modal will close."),
                                trailing: const Icon(Icons.arrow_forward_ios),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.home),
                                title: const Text("Home"),
                                trailing: const Icon(Icons.arrow_forward_ios),
                                onTap: () {
                                  // Navigator.pop(context);
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          backgroundColor: Colors.amberAccent,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const SizedBox(
                                                height: 36,
                                              ),
                                              const Text("Are you sure?"),
                                              const SizedBox(
                                                height: 40,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text("Yes")),
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text("No")),
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      });
                                },
                              ),
                              PopupMenuButton(
                                offset: const Offset(-40, 50),
                                itemBuilder: (context) {
                                  return [
                                    const PopupMenuItem(
                                      child: Text("Item 1"),
                                    ),
                                    const PopupMenuItem(
                                      child: Text("Item 2"),
                                    ),
                                    const PopupMenuItem(
                                      child: Text("Item 3"),
                                    ),
                                  ];
                                },
                                icon: const Icon(Icons.more_vert),
                                // // icon: ListTile(
                                // //   leading: const Icon(Icons.home),
                                // //   title: const Text("Pop up menu "),
                                // //   // trailing: const Icon(Icons.arrow_forward_ios),
                                // //   // trailing: PopupMenuButton(
                                // //   //   itemBuilder: (context) {
                                // //   //     return [
                                // //   //       const PopupMenuItem(
                                // //   //         child: Text("Item 1"),
                                // //   //       ),
                                // //   //       const PopupMenuItem(
                                // //   //         child: Text("Item 2"),
                                // //   //       ),
                                // //   //       const PopupMenuItem(
                                // //   //         child: Text("Item 3"),
                                // //   //       ),
                                // //   //     ];
                                // //   //   },
                                // //   // ),

                                // //   onTap: () {
                                // //     // Navigator.pop(context);
                                // //   },
                                // ),
                              ),
                              ListTile(
                                leading: const Icon(Icons.home),
                                title: const Text("Home"),
                                trailing: const Icon(Icons.arrow_forward_ios),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        });
                  },
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
                ),
              )
            ],
          );
        });
  }
}
