import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/eye.jpg', // Replace with your logo image path
                width: 150,
                height: 150,
              ),
              SizedBox(height: 20),
              Text(
                'Eye Consult',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "This app is the product of the authors' undergraduate reseach. The app is intended to be used for detecting glaucoma and retinal fundus images",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Developed by:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "Berchie Opoku Samuel\n Adofo Obeng Denis\n Agbavor Simon \n Otchere-Peprah Nana Yaw\n",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Contact us at: soberchie@gmail.com',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
