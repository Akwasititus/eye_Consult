import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onbording screen/onbording_home.dart';
import 'screens/home.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(
      DevicePreview(
        builder: (context) => MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Future<bool> hasCompletedOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboardingCompleted') ?? false;
  }

  Future<void> markOnboardingCompleted() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingCompleted', true);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Eye Consult',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: FutureBuilder<bool>(
          future: hasCompletedOnboarding(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              bool onboardingCompleted = snapshot.data!;
              return onboardingCompleted
                  ? ImagePickerWidget()
                  : OnbordingHome();
            }
          },
        ));
  }
}
