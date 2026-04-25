import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final List<String> items =
      List.generate(10, (index) => "Berkas ${index + 1}");

  @override
  Widget build(BuildContext context) {
    final String email =
        ModalRoute.of(context)?.settings.arguments as String? ?? "User";

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/',
                (route) => false,
              );
            },
          )
        ],
      ),

      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                CircleAvatar(child: Icon(Icons.person)),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Selamat datang",
                        style: TextStyle(color: Colors.white)),
                    Text(email,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: Icon(Icons.folder, color: Colors.blue),
                    title: Text(items[index]),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}