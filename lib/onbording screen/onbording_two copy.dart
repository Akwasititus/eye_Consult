import 'package:flutter/material.dart';


class OnbordingTwo extends StatefulWidget {
  const OnbordingTwo({super.key});

  @override
  State<OnbordingTwo> createState() => _OnbordingTwoState();
}

class _OnbordingTwoState extends State<OnbordingTwo> {
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
                    color: Color.fromARGB(255, 137, 215, 72),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0))),
                child: Center(
                  child: Image.asset(
                    'assets/img2.jpg',height: 200,
                  ),
                )),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Image Type',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF1E1E1E))),
                Text(
                    'Feed the Model with a retinal fundus images',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
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