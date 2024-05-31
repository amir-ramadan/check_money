import 'package:application/camera/login_register.dart';
import 'package:application/screens/welcome.dart';
import 'package:flutter/material.dart';

class JoinHome extends StatelessWidget {
  const JoinHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 400,
              width: 600,
              // padding: EdgeInsets.all(100),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage('assets/join.jpg')),
              )),
          const SizedBox(
            height: 40,
          ),

          const Text('CMS',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 10,
          ),

          const Text('Check Your Banknote',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 50,
          ),

          SizedBox(
            width: 350,
            height: 50,
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 211, 179, 56),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginRegister()));
                },
                child: const Text('Join',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ))),
          ),

          //      ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder:(context)=> const WelcomeHome()));
          //      },child: Text('back')
          // ,),
        ],
      ),
    );
  }
}
