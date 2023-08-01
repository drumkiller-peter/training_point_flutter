import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetPostScreen extends StatelessWidget {
  const GetPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Getting API Posts"),
      ),
      body: FutureBuilder(
          // future: Future.delayed(
          //   const Duration(seconds: 2),
          // ),
          future:
              http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts")),
          builder: (context, snapshot) {
            log(snapshot.connectionState.toString());
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              var data = snapshot.data as http.Response;
              if (data.statusCode == 200 && snapshot.hasData) {
                final todoData = jsonDecode(data.body);
                log(todoData.runtimeType.toString());

                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: todoData.length,
                      itemBuilder: (context, index) {
                        final title = todoData[index]['title'];
                        final body = todoData[index]['body'];
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              onTap: () async {
                                var response = await http.patch(
                                  Uri.parse(
                                      "https://jsonplaceholder.typicode.com/posts/1"),
                                  body: {'title': 'new data', 'id': "1"},
                                  headers: {
                                    'content_type': 'application/json',
                                  },
                                );

                                if (response.statusCode == 200 ||
                                    response.statusCode == 201) {
                                  log("Data posted successfully");
                                  log(response.body.toString());
                                } else {
                                  log(response.body);
                                  log(response.statusCode.toString());
                                }
                              },
                              title: Text(title),
                              subtitle: Text(body),
                            ));
                      });
                } else {
                  const Text("No data");
                }
              }
            }
            return Container(
              height: 300,
              width: double.infinity,
              color: Colors.pinkAccent,
              child: const Text("Empty"),
            );
          }),
    );
  }
}
