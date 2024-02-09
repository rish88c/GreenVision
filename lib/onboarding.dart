import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'front.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: [
            buildPage(
                color: Colors.green.shade100,
                urlImage: 'assets/page1.png',
                title: 'Introduction',
                subtitle:
                    'The ability to identify plant species is essential for many amateur gardeners, horticulturists, and nature enthusiasts. Traditional methods of plant identification require extensive knowledge and experience, making it challenging for beginners. This project aims to develop an AI-based plant detection system that can help amateurs and hobbyists identify plant species easily and accurately.'),
            buildPage(
                color: Colors.blue.shade100,
                urlImage: 'assets/metho.png',
                title: 'Methodoloy',
                subtitle:
                    'The AI algorithm was developed using a Convolutional Neural Network (CNN) architecture trained on a dataset of plant images.The dataset consisted of images of common plant species, sourced from publicly available datasets and online resources.'),
            buildPage(
                color: Colors.yellow.shade50,
                urlImage: 'assets/gv.png',
                title: 'Get Started',
                subtitle:
                    'Get started on your plant journey today with Green Vision - the perfect companion for any aspiring botanist.')
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.teal.shade700,
                  minimumSize: const Size.fromHeight(80)),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('showHome', true);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return const Front();
                    },
                  ),
                );
              },
              child: const Text('Get Started', style: TextStyle(fontSize: 24)),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        controller.jumpToPage(2);
                      },
                      child: const Text('SKIP')),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      onDotClicked: (index) {
                        controller.animateToPage(index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      child: const Text('NEXT')),
                ],
              ),
            ),
    );
  }

  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle,
  }) =>
      Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              urlImage,
              fit: BoxFit.scaleDown,
              width: 200,
            ),
            const SizedBox(height: 30),
            Text(
              title,
              style: TextStyle(
                color: Colors.teal.shade700,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                subtitle,
                style: const TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
            )

          ],
        ),
      );
}
