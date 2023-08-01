import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SimpleApiCallScreen extends StatelessWidget {
  const SimpleApiCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Api call with future builder"),
        ),
        body: FutureBuilder(
            future: http
                .get(Uri.parse("https://jsonplaceholder.typicode.com/posts")),
            builder: (context, snapShot) {
              if (snapShot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapShot.connectionState == ConnectionState.done) {
                var data = snapShot.data as http.Response;
                if (data.statusCode == 200) {
                  final body = data.body;
                  log(body);
                  final userData = jsonDecode(body);
                  log(body.runtimeType.toString());
                  log(userData.runtimeType.toString());
                  return Container(
                    height: 300,
                    width: double.infinity,
                    color: Colors.pinkAccent,
                    child: Text(" title: ${userData[0]['title']}"),
                  );
                }

                log(data.body);
                return Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.pinkAccent,
                  child: const Text(" i don't have data"),
                );
              }
              return Container(
                height: 300,
                width: double.infinity,
                color: Colors.pinkAccent,
              );
            }));
  }
}
