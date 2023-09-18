import 'package:flutter/material.dart';


class OnbordingThree extends StatefulWidget {
  const OnbordingThree({super.key});

  @override
  State<OnbordingThree> createState() => _OnbordingThreeState();
}

class _OnbordingThreeState extends State<OnbordingThree> {
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
                    color: Color.fromARGB(255, 34, 193, 190),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0))),
                child: Center(
                  child: Image.asset(
                    'assets/img1.jpg',height: 200,
                  ),
                )),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Uploading of Images',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF1E1E1E))),
                Text(
                    'Avoid uploading fake images',
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