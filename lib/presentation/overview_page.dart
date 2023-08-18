import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxstore/model/item_model.dart';

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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //category
              CategoriesWidget(),
              //main banner
              MainBannerWidget(),
              //feature product
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Feature Products',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Show all',
                    style: TextStyle(
                        color: Color(0xFF9B9B9B), fontSize: 13, fontWeight: FontWeight.w400),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ListFeatureProductWidget(),
              //banner 2
              SizedBox(
                height: 20,
              ),
              Banner2Widget(),
              //recommend
              //top collection
            ],
          ),
        ),
      ),
    );
  }
}

class Banner2Widget extends StatelessWidget {
  const Banner2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: Colors.amber,
      child: TextField(),
    );
  }
}

class ListFeatureProductWidget extends StatefulWidget {
  const ListFeatureProductWidget({super.key});

  @override
  State<ListFeatureProductWidget> createState() => _ListFeatureProductWidgetState();
}

class _ListFeatureProductWidgetState extends State<ListFeatureProductWidget> {
  final List<ItemModel> _listItem = [
    ItemModel(
        imagePath: 'assets/images/item_product_1.jpeg',
        nameProduct: 'Turtleneck Sweater',
        price: '\$ 39.99'),
    ItemModel(
        imagePath: 'assets/images/item_product_2.png',
        nameProduct: 'Long Sleeve Dress',
        price: '\$ 45.00'),
    ItemModel(
        imagePath: 'assets/images/item_product_3.png',
        nameProduct: 'Sportwear Set',
        price: '\$ 80.00'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: _listItem.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 300,
                  width: 200,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        filterQuality: FilterQuality.high,
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                        _listItem[index].imagePath,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  _listItem[index].nameProduct,
                  style: const TextStyle(
                    color: Color(0xFF1D1F22),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  _listItem[index].price,
                  style: const TextStyle(
                    color: Color(0xFF1D1F22),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildCategories('assets/icons/categories_women.svg', 'Women', true),
            buildCategories('assets/icons/categories_men.svg', 'Men', false),
            buildCategories('assets/icons/categories_accessories.svg', 'Accessories', false),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
      mainAxisAlignment: MainAxisAlignment.center,
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        'assets/images/main_banner.jpeg',
        fit: BoxFit.cover,
      ),
    );
  }
}
