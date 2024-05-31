import 'package:application/screens/join.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeHome extends StatelessWidget {
  const WelcomeHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 300,
              height: 200,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Image.asset(
                'assets/welcome.jpg',
                fit: BoxFit.cover,
              )),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Welcome',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                'Join now with CMS: Your Banknote Is Safe And Not',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
          const Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                'Counterfeit!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
              height: 50,
              width: 130,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black38),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const JoinHome()));
                },
                child: const Text(
                  'next',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )),
        ],
      ),
    ));
  }
}

// Padding(
// padding: EdgeInsets.only(bottom: 250),
// child: Container(
// decoration: const BoxDecoration(image: DecorationImage(
// image: AssetImage('assets/welcome.jpg'),
// )
// ),
// ),
// )
