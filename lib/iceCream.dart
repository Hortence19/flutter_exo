import 'package:flutter/material.dart';
import 'package:flutter_exo/detail.dart';

class Icecream extends StatefulWidget {
  const Icecream({super.key});

  @override
  State<Icecream> createState() => _IcecreamState();
}

List iceDetail = [
  {
    "image": "iceCream.png",
    "title": "Double Deck",
    "subtitle": "Jam and cream vanilla",
    "price": "10",
  },
  {
    "image": "groupIce.png",
    "title": "Double Deck",
    "subtitle": "Jam and cream vanilla",
    "price": "10",
  },
  {
    "image": "iceCream.png",
    "title": "Double Deck",
    "subtitle": "Jam and cream vanilla",
    "price": "10",
  },
  {
    "image": "groupIce.png",
    "title": "Double Deck",
    "subtitle": "Jam and cream vanilla",
    "price": "10",
  },
];

Widget iceCard(String image, String title, String subtitle, String price) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Row(
      children: [
        Image.asset("assets/$image", width: 80, height: 80),
        ListTile(title: Text(title), subtitle: Text(subtitle)),
        TextButton(onPressed: () {}, child: Text(price)),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var roundnessFactor = 50.0;

    path.moveTo(0, size.height * 0.45);
    path.lineTo(0, size.height - roundnessFactor);
    path.quadraticBezierTo(0, size.height, roundnessFactor, size.height);
    path.lineTo(size.width - roundnessFactor, size.height);
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width,
      size.height - roundnessFactor,
    );
    path.lineTo(size.width, roundnessFactor * 2);
    path.quadraticBezierTo(
      size.width - 10,
      roundnessFactor,
      size.width - roundnessFactor * 1.5,
      roundnessFactor * 1.5,
    );
    path.lineTo(
      roundnessFactor * 0.8,
      size.height * 0.45 - roundnessFactor * 0.3,
    );
    path.quadraticBezierTo(
      0,
      size.height * 0.45,
      0,
      size.height * 0.45 + roundnessFactor,
    );

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class _IcecreamState extends State<Icecream> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const ListTile(
              title: Text(
                "Store",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              subtitle: Text("20 Jan 2020 Monday"),
              trailing: Icon(Icons.cloud, color: Colors.black),
            ),
            const SizedBox(height: 15),
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipPath(
                      clipper: BackgroundClipper(),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.6,
                        decoration: BoxDecoration(color: Color(0xFFFFA865)),
                        child: Stack(
                          children: [
                            Center(
                              child: ListTile(
                                title: Text(
                                  "Most",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  "Orange ice cream",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Detail(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                    ),
                                  ),
                                  backgroundColor:
                                      Colors.deepOrange, // couleur de fond
                                  minimumSize: const Size(40, 40),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      top: -60,
                      left: 0,
                      right: 0,
                      child: Transform.rotate(
                        angle: -.5,
                        child: Image.asset("assets/Ice1.png", height: 400),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Will buy",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Container(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: iceDetail.expand((i) {
            //       return [
            //         iceCard(i["image"], i["title"], i["subtitle"], i["price"]),
            //         SizedBox(height: 15),
            //       ];
            //     }).toList()..removeLast(),
            //   ),
            // ),
          ],
        ),
      ),

      bottomNavigationBar: SizedBox(
        height: 80,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: SizedBox(height: 30),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.cyclone),
                  label: "Circle",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.local_mall_rounded),
                  label: "Trade",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.message_rounded),
                  label: "My",
                ),
              ],
            ),

            Positioned(
              top: -50,
              left: 0,
              child: Transform.rotate(
                angle: -.4,
                child: Image.asset("assets/Ice1.png", height: 100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
