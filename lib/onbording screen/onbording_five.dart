import 'package:flutter/material.dart';


class OnbordingFive extends StatefulWidget {
  const OnbordingFive({super.key});

  @override
  State<OnbordingFive> createState() => _OnbordingFiveState();
}

class _OnbordingFiveState extends State<OnbordingFive> {
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
                    color: Color.fromARGB(255, 176, 72, 245),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0))),
                child: Center(
                  child: Image.asset(
                    'assets/img5.jpg',
                  ),
                )),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Please "NOTE"',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF1E1E1E))),
                Text(
                    'The model utilizes machine learning Techniques and has the potential to generate inaccurate predictions',
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