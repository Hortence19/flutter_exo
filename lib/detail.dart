import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

List content = [
  {"icon": 'food.png', "text": 'soup'},
  {"icon": 'food1.png', "text": 'seafood'},
  {"icon": 'food2.png', "text": 'sushi'},
];

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var roundnessFactor = 50.0;

    path.moveTo(0, size.height * 0.33);
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
      roundnessFactor * 0.6,
      size.height * 0.33 - roundnessFactor * 0.3,
    );
    path.quadraticBezierTo(
      0,
      size.height * 0.33,
      0,
      size.height * 0.33 + roundnessFactor,
    );

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

Widget myContainer(IconData icon, String text) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Color.fromARGB(97, 224, 125, 49),
    ),
    padding: EdgeInsets.all(15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
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

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFA865),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [Icon(Icons.more_outlined)],
      ),
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            ClipPath(
              clipper: BackgroundClipper(),
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
              ),
            ),

            // Texte centré
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Center(
                      child: ListTile(
                        title: Text(
                          "Tangerine Cream Ice Cream",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                        subtitle: Text(
                          "Lorem Ipsum is simply dummy text ofbeen the , when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, ",
                        ),
                        trailing: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          onPressed: () {},
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Row(
                          children: [
                            myContainer(Icons.filter_alt_outlined, "500ml"),
                            SizedBox(width: 10),
                            myContainer(Icons.snowing, "less ice"),
                            SizedBox(width: 10),
                            myContainer(Icons.water_drop_outlined, "Sugar"),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Services",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ],
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Detail()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  backgroundColor: Colors.deepOrange,
                ),
                child: Text("Buy"),
              ),
            ),

            Positioned(
              top: -100,
              left: 0,
              right: -150,
              child: Transform.rotate(
                angle: -.4,
                child: Image(image: AssetImage("assets/Ice1.png"), height: 400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
