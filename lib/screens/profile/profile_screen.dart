import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const TabBar(padding: EdgeInsets.all(32), tabs: [
              Text("All"),
              Text("Sold"),
              Tab(
                icon: Icon(Icons.percent),
                text: "Buy",
              ),
            ]),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    child: const Text("i am all element"),
                  ),
                  Container(
                    color: Colors.teal,
                    child: const Text("i am all Sold Section"),
                  ),
                  Container(
                    color: Colors.green,
                    child: const Text("i am all Buy"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
