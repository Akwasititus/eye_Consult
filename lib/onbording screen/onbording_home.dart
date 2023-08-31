import 'package:flutter/material.dart';



import '../screens/home.dart';
import 'onbording_five.dart';
import 'onbording_four.dart';
import 'onbording_one.dart';
import 'onbording_three.dart';
import 'onbording_two copy.dart';

class OnbordingHome extends StatefulWidget {
  const OnbordingHome({Key? key}) : super(key: key);

  @override
  State<OnbordingHome> createState() => _OnbordingHomeState();
}

class _OnbordingHomeState extends State<OnbordingHome> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List _pages = [
    const OnbordingOne(),
    const OnbordingTwo(),
    const OnbordingThree(),
    const OnbordingFour(),
    const OnbordingFive(),
  ];
  _onPageChange(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              onPageChanged: _onPageChange,
              itemCount: _pages.length,
              itemBuilder: (BuildContext context, int index) {
                return _pages[index];
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                _pages.length,
                (index) => AnimatedContainer(
                      duration: const Duration(microseconds: 500),
                      height: 5,
                      decoration: BoxDecoration(
                          color: (index == currentPage)
                              ?  Colors.orange
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(5)),
                      width: (index == currentPage) ? 20 : 10,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                    )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: deviceSize.width * 0.05),
            child: Column(
              children: [
                TextButton(
                    onPressed: () {
                      if ((currentPage == (_pages.length - 1))) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  ImagePickerWidget()));
                      } else {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOutCubicEmphasized);
                      }
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            color:  Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            (currentPage == (_pages.length - 1))
                                ? 'Continue'
                                : 'Next',
                          ),
                        ))),
                Text(
                    (currentPage == (_pages.length - 1))
                        ? 'msk v1'
                        : (currentPage == (_pages.length - 2))
                            ? "Ready"
                            : (currentPage == (_pages.length - 3))
                                ? "Amost there"
                                : (currentPage == (_pages.length - 4))
                                    ? "More to see"
                                    : "swap for more >>>",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff1D4771),
                    )),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
