import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import 'drawer children/about.dart';
import 'drawer children/how_to_use.dart';

class MyYoungDrawer extends StatelessWidget {
  const MyYoungDrawer({super.key});


  final String appDownloadLink =
      'https://play.google.com/store/apps/details?id=com.example.sammy';
  void shareApp() {
    Share.share(appDownloadLink);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange, // Background color of the drawer
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            textColor: Colors.black,
            iconColor: Colors.white,
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Add the functionality you want when the user taps on 'Home'

              Navigator.pop(context); // Close the drawer after tapping
            },
          ),

          ListTile(
            textColor: Colors.black,
            iconColor: Colors.white,
            leading: const Icon(Icons.book_online),
            title: const Text('How To Use'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HowToUseScreen()),
              );

              // Add the functionality you want when the user taps on 'Settings'
              // Navigator.pop(context); // Close the drawer after tapping
            },
          ),
          SizedBox(
            height: 50,
          ),

          Divider(
            thickness: 1,
          ),
          ListTile(
            textColor: Colors.black,
            iconColor: Colors.white,
            leading: const Icon(Icons.person),
            title: const Text('About us'),
            onTap: () {
              Navigator.pop(context); // Close the drawer after tapping

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutUsScreen()),
              );
            },
          ),
          // Add more list items as needed

          ListTile(
            textColor: Colors.black,
            iconColor: Colors.white,
            leading: const Icon(Icons.share),
            title: const Text('Share'),
            onTap: () {
              shareApp();
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
