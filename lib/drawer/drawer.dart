import 'package:flutter/material.dart';

class MyYoungDrawer extends StatelessWidget {
  const MyYoungDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue, // Background color of the drawer
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            
            textColor: Colors.white,
            iconColor: Colors.white,
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Add the functionality you want when the user taps on 'Home'
              Navigator.pop(context); // Close the drawer after tapping
            },
          ),
          ListTile(
            textColor: Colors.white,
            iconColor: Colors.white,
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Add the functionality you want when the user taps on 'Settings'
              Navigator.pop(context); // Close the drawer after tapping
            },
          ),
          ListTile(
            textColor: Colors.white,
            iconColor: Colors.white,
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              // Add the functionality you want when the user taps on 'Profile'
              Navigator.pop(context); // Close the drawer after tapping
            },
          ),
          // Add more list items as needed
        ],
      ),
    );
  }
}
