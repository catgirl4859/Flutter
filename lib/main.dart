import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyCAT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0x3AFF96D3),
      ),
      home: TabbedCatApp(),
    );
  }
}

class TabbedCatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('MyCAT'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: "Home"),
              Tab(icon: Icon(Icons.pets), text: "Cats"),
              Tab(icon: Icon(Icons.settings), text: "Settings"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text("Welcome to MyCAT!")),
            CatListScreen(),
            Center(child: Text("Settings Page")),
          ],
        ),
      ),
    );
  }
}

class CatListScreen extends StatefulWidget {
  @override
  _CatListScreenState createState() => _CatListScreenState();
}

class _CatListScreenState extends State<CatListScreen> {
  final List<Map<String, dynamic>> cats = [
    {"name": "먼치킨", "description": "엄청 귀여움", "image": "assets/cat1.jpeg", "isLiked": false},
    {"name": "노르웨이 숲", "description": "고급진", "image": "assets/cat2.jpg", "isLiked": false},
    {"name": "페르시안", "description": "못생긴", "image": "assets/cat3.jpeg", "isLiked": false},
    {"name": "브리티쉬 숏헤어", "description": "잘생긴", "image": "assets/cat4.jpeg", "isLiked": false},
    {"name": "랙돌", "description": "털쟁이", "image": "assets/cat5.jpg", "isLiked": false},
  ];

  void toggleLike(int index) {
    setState(() {
      cats[index]["isLiked"] = !cats[index]["isLiked"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cats.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(cats[index]["image"], width: 50, height: 50, fit: BoxFit.cover),
            title: Text('${index + 1}. ${cats[index]["name"]}', style: TextStyle(color: Colors.purple)),
            subtitle: Text(cats[index]["description"]),
            trailing: IconButton(
              icon: Icon(
                cats[index]["isLiked"] ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: () => toggleLike(index),
            ),
          ),
        );
      },
    );
  }
}