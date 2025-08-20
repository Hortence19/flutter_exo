import 'package:flutter/material.dart';
import 'package:flutter_exo/onboarding.dart';

class Welcomepage extends StatelessWidget {
  const Welcomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3FB4B1),
      // appBar: AppBar(backgroundColor: Colors.red),
      body: Stack(
        children: [
          Image.asset(
            'assets/bg.png',
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png'),
                Text(
                  "Meals on Demand",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                SizedBox(height: 150),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(209, 62),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Onboarding()),
                    );
                  },
                  child: Text(
                    "Let's start",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
