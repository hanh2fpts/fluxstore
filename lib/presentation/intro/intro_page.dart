import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluxstore/model/intro_model.dart';
import 'package:fluxstore/presentation/home/home_page.dart';
import 'package:fluxstore/presentation/widget/intro_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});
  static const routeName = 'intro_page';

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int _activeIndex = 0;
  final List<IntroModel> _listIntro = [
    IntroModel(
      imagePath: 'assets/images/intro1.png',
      title: 'Discover something new',
      description: 'Special new arrivals just for you',
    ),
    IntroModel(
      imagePath: 'assets/images/intro2.png',
      title: 'Update trendy outfit',
      description: 'Favorite brands and hottest trends',
    ),
    IntroModel(
      imagePath: 'assets/images/intro3.png',
      title: 'Explore your true style',
      description: 'Relax and let us bring the style to you',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          bottom: 0,
          child: Container(
            height: size.height / 2 - 50,
            width: size.width,
            decoration: const BoxDecoration(color: Color(0xFF464447)),
          ),
        ),
        CarouselSlider.builder(
          options: CarouselOptions(
            height: size.height,
            enableInfiniteScroll: false,
            scrollDirection: Axis.horizontal,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
            onPageChanged: (index, reason) {
              setState(() {
                _activeIndex = index;
              });
            },
          ),
          itemCount: _listIntro.length,
          itemBuilder: (context, index, realIndex) {
            final item = _listIntro[index];
            return IntroWidget(
                title: item.title, description: item.description, imagePath: item.imagePath);
          },
        ),
        Positioned(
            bottom: size.height / 8,
            child: Column(
              children: [
                AnimatedSmoothIndicator(
                  activeIndex: _activeIndex,
                  count: _listIntro.length,
                  effect: const SlideEffect(
                      dotWidth: 6.0,
                      dotHeight: 6.0,
                      paintStyle: PaintingStyle.stroke,
                      strokeWidth: 1.5,
                      dotColor: Colors.white,
                      activeDotColor: Colors.white),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 50,
                  width: size.width - 150,
                  child: OutlinedButton(
                      onPressed: () =>
                          Navigator.of(context).pushReplacementNamed(HomePage.routeName),
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.25),
                          side: const BorderSide(color: Colors.white)),
                      child: const Text(
                        'Shopping now',
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
