import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/simple_api_call/repository/user_repository.dart';

class UserDataScreen extends StatelessWidget {
  const UserDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = UserRepository();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Showing user Data"),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: userRepository.getUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                var item = snapshot.data as List<UserModel>;
                return Expanded(
                  child: ListView.builder(
                      itemCount: item.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(item[index].name),
                          subtitle: Text(item[index].position),
                          onTap: () async {
                            await userRepository.postUserData(
                              UserModel(id: DateTime.now().millisecond, name: "name", position: "position")
                            );
                          },
                        );
                      }),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
