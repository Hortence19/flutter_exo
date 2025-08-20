import 'package:flutter/material.dart';
import 'package:flutter_exo/homeScreen.dart';

class Verificationscreen extends StatefulWidget {
  const Verificationscreen({super.key});

  @override
  _VerificationscreenState createState() => _VerificationscreenState();
}

class _VerificationscreenState extends State<Verificationscreen> {
  Widget myContainer(String text, IconData icon) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      height: 172,
      margin: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(icon, size: 40), SizedBox(height: 10), Text(text)],
      ),
    );
  }

  String? selectedMethod;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: []),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "Verification Method",
                  style: TextStyle(color: Colors.black, fontSize: 48),
                ),
                subtitle: Text(
                  "Lorem ipsum dolor sit amet, consectetur.",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(60),
                        backgroundColor: selectedMethod == 'contact'
                            ? Color(0xFF462F4D)
                            : Color(0xFFD5EEEE),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedMethod = 'contact';
                        });
                      },
                      child: myContainer("Contact", Icons.contact_page),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(60),
                        backgroundColor: selectedMethod == 'sms'
                            ? Color(0xFF462F4D)
                            : Color(0xFFD5EEEE),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedMethod = 'sms';
                        });
                      },
                      child: myContainer("SMS", Icons.sms),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 350),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Homescreen()),
                  );
                },
                child: Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
