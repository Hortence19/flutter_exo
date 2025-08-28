import 'package:flutter/material.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

List searchItems = [
  {"image": 'search1.png', "text": 'Foodrecipes'},
  {"image": 'search2.png', "text": 'Live'},
  {"image": 'search3.png', "text": 'Galleries'},
];

Widget myContainer(String image, String text) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Color(0xFFD5EEEE),
    ),

    padding: EdgeInsets.all(8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/$image", width: 24, height: 24),
        SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(fontSize: 12),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}

class _SearchscreenState extends State<Searchscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search_outlined),
                  hint: Text("Search"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color(0xFFD5EEEE),
                ),
              ),
            ),
            Container(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: searchItems.expand((f) {
                  return [
                    Expanded(child: myContainer(f["image"], f["text"])),
                    SizedBox(width: 10),
                  ];
                }).toList()..removeLast(),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
