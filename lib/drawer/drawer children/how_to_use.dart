import 'package:flutter/material.dart';

class HowToUseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('How to Use'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'How to Use the App',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Welcome to our app! Here are the steps to get started:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              _buildStep(1, 'Step 1: Create an Account'),
              _buildStep(2, 'Step 2: Log In'),
              _buildStep(3, 'Step 3: Upload an Image'),
              _buildStep(4, 'Step 4: View Results'),
              SizedBox(height: 20),
              Text(
                'For additional help or support, contact us at:',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'soberchie@gmail.com',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep(int stepNumber, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$stepNumber.',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

