import 'package:flutter/material.dart';
import 'package:flutter_exo/searchScreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

List foodItems = [
  {"image": 'food.png', "text": 'soup'},
  {"image": 'food1.png', "text": 'seafood'},
  {"image": 'food2.png', "text": 'sushi'},
  {"image": 'food.png', "text": 'pasta'},
  {"image": 'food.png', "text": 'salad'},
];

List recipesItems = [
  {"image": "recipes.png", "text": "Devilled whitebait and calamari"},
  {"image": "recipes1.png", "text": "Devilled whitebait and calamari"},
  {"image": "recipes2.png", "text": "Devilled whitebait and calamari"},
];

List chefItems = [
  {"image": "chef1.png", "title": "Antonio", "subtitle": "89 Recipes"},
  {"image": "chef2.png", "title": "Santana", "subtitle": "87 Recipes"},
  {"image": "chef3.png", "title": "John S", "subtitle": "83 Recipes"},
  {"image": "chef4.png", "title": "Miller", "subtitle": "86 Recipes"},
];

Widget myContainer(String image, String text) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Color(0xFFD5EEEE),
    ),
    width: 106,
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

Widget recipesCard(String image, String text) {
  return Container(
    width: 280,
    height: 203,
    margin: EdgeInsets.only(right: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.grey[300],
    ),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            "assets/$image",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          left: 15,
          right: 15,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}

Widget recipesCard1(String image, String text) {
  return Container(
    width: double.infinity,
    height: 206,
    margin: EdgeInsets.only(right: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.grey[300],
    ),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            "assets/$image",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          left: 15,
          right: 15,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}

Widget chefCard(String image, String title, String subtitle) {
  return Column(
    children: [
      Image.asset("assets/$image", width: 80, height: 113),
      SizedBox(width: 5),
      Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 3),
      Text(subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
    ],
  );
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/avatar.png"),
            radius: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Searchscreen()),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Text(
              "What do you want to cook today?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: foodItems.expand((f) {
                  return [
                    myContainer(f["image"], f["text"]),
                    SizedBox(width: 10),
                  ];
                }).toList()..removeLast(),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Live Cooking",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "view all",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: recipesItems.expand((r) {
                  return [
                    recipesCard(r["image"], r["text"]),
                    SizedBox(width: 15),
                  ];
                }).toList()..removeLast(),
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top chef",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "view all",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              children: chefItems.expand((c) {
                return [
                  Expanded(
                    child: chefCard(c["image"], c["title"], c["subtitle"]),
                  ),
                  SizedBox(width: 10),
                ];
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular Recipes",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "view all",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: recipesItems.expand((r) {
                  return [
                    recipesCard1(r["image"], r["text"]),
                    SizedBox(height: 15),
                  ];
                }).toList()..removeLast(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 2,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF3FB4B1),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: "Search",
          ),
          BottomNavigationBarItem(
            label: "add",
            icon: ElevatedButton(
              onPressed: () {},
              child: Icon(Icons.add),
              style: ElevatedButton.styleFrom(shape: CircleBorder()),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active_outlined),
            label: "Notification",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Person"),
        ],
      ),
    );
  }
}
