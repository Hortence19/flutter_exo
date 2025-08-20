import 'package:flutter/material.dart';
import 'package:flutter_exo/loginScreen.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List onboardingItems = [
    {
      "image": 'assets/ob1.png',
      "title": 'Shape your recipes',
      "subtitle":
          'Lorem upsim dolor sit amet, conseceur lit des do emptettfvcdhsvfgru',
    },
    {
      "image": 'assets/ob2.png',
      "title": 'second your recipes',
      "subtitle":
          'Lorem upsim dolor sit amet, conseceur lit des do emptettfvcdhsvfgru',
    },
    {
      "image": 'assets/ob3.png',
      "title": 'Third your recipes',
      "subtitle":
          'Lorem upsim dolor sit amet, conseceur lit des do emptettfvcdhsvfgru',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: onboardingItems.length,
        itemBuilder: (context, index) {
          print("index: $index");
          print("position: ${index + 1}");
          return Stack(
            alignment: AlignmentGeometry.bottomCenter,
            children: [
              Image.asset(
                onboardingItems[index]["image"],
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black],
                  ),
                ),
                // height: MediaQuery.of(context).size.height * 1 / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ListTile(
                      title: Text(
                        onboardingItems[index]["title"],
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                      subtitle: Text(
                        onboardingItems[index]["subtitle"],
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      trailing: Visibility(
                        visible: index + 1 == onboardingItems.length,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Loginscreen(),
                              ),
                            );
                          },
                          child: Text("Skip"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: LinearProgressIndicator(
                        minHeight: 7,
                        value: (index + 1) / onboardingItems.length,
                        borderRadius: BorderRadius.circular(5),
                        backgroundColor: Colors.grey[900],
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
