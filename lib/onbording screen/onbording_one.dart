import 'package:flutter/material.dart';



class OnbordingOne extends StatefulWidget {
  const OnbordingOne({super.key});

  @override
  State<OnbordingOne> createState() => _OnbordingOneState();
}

class _OnbordingOneState extends State<OnbordingOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 3,
            child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0))),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.center,
                      child: Image.asset(
                        'assets/eye.jpg',height: 200,
                      ),
                    ),
                  ],
                )),
          ),
           Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Introducing the New Inspiration App: \n Explore Bible Quotes to Ignite Your Imagination.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF474A56))),
              ],
            ),
          ),
          const SizedBox(height: 15.0),
        ],
      ),
    );
  }
}