import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fluxstore',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/icons/icon_menu.svg'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/icon_bell.svg'),
            ),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //category
            CategoriesWidget(),
            //main banner
            MainBannerWidget(),
            //feature product
            //banner 2
            //recommend
            //top collection
          ],
        ),
      ),
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      height: 100,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildCategories('assets/icons/categories_women.svg', 'Women', true),
            buildCategories('assets/icons/categories_men.svg', 'Men', false),
            buildCategories('assets/icons/categories_accessories.svg', 'Accessories', false), 
            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    //border: Border.all(color: Colors.black),
                    color: Color(0xFFF3F3F3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: SvgPicture.asset('assets/icons/categories_beauty.svg'),
                  ),
                ),
                const Text('Beauty')
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column buildCategories(String image, String name, bool isSelected) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: isSelected
                ? Border.all(color: Colors.black)
                : Border.all(color: Colors.transparent),
          ),
          child: Padding(
            padding: const EdgeInsets.all(1),
            child: SvgPicture.asset(image),
          ),
        ),
        Text(name)
      ],
    );
  }
}

class MainBannerWidget extends StatelessWidget {
  const MainBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/images/main_banner.jpeg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
