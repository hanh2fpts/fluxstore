import 'package:flutter/material.dart';
import 'package:fluxstore/presentation/intro_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
            child: Image.asset(
          'assets/images/image_welcome.png',
          fit: BoxFit.contain,
        )),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
          ),
        ),
        Positioned(
            bottom: size.height / 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to Fluxstore!',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Text(
                  'The home for a fashionista',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 50,
                  child: OutlinedButton(
                      onPressed: () => Navigator.of(context).pushNamed(IntroPage.routeName),
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.25),
                          side: const BorderSide(color: Colors.white)),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                )
              ],
            ))
      ],
    ));
  }
}
