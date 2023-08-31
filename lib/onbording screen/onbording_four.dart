import 'package:flutter/material.dart';


class OnbordingFour extends StatefulWidget {
  const OnbordingFour({super.key});

  @override
  State<OnbordingFour> createState() => _OnbordingFourState();
}

class _OnbordingFourState extends State<OnbordingFour> {
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
                    color: Color.fromARGB(255, 234, 107, 53),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0))),
                child: Center(
                  child: Image.asset(
                    'assets/images/navigate.png',height: 200,
                  ),
                )),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Next to Navigate',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF1E1E1E))),
                Text(
                    'Select the "next" button to move to a different quote.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF878787)))
              ],
            ),
          ),
        ],
      ),
    );
  }
}