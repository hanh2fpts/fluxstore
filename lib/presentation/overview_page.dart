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
              TitleWidget(title: 'Feature Products'),
              SizedBox(
                height: 20,
              ),
              ListFeatureProductWidget(),
              //banner 2
              Banner2Widget(),
              //recommend
              SizedBox(
                height: 20,
              ),
              TitleWidget(title: 'Recommended'),
              SizedBox(
                height: 20,
              ),
              ListRecommendItemWidget(),
              //top collection
              SizedBox(
                height: 20,
              ),
              TitleWidget(title: 'Top Collection'),
              SizedBox(
                height: 20,
              ),
              Banner3Widget(
                title: 'I Sale up to 40%',
                description: 'FOR SLIM\n& BEAUTY',
                height: 200,
                imagePath: 'assets/images/banner3.png',
              ),
              SizedBox(
                height: 20,
              ),
              Banner3Widget(
                title: 'Summer Collection 2023',
                description: 'Most sexy\n& fabulous\ndesign',
                height: 300,
                imagePath: 'assets/images/image_69.png',
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Banner3Widget extends StatelessWidget {
  const Banner3Widget(
      {super.key,
      required this.title,
      required this.description,
      required this.height,
      required this.imagePath});
  final String title;
  final String description;
  final double height;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8FA),
        borderRadius: BorderRadius.circular(20),
      ),
      height: height,
      child: Stack(
        children: [
          Positioned(right: 0, child: _buildImage()),
          Positioned(
            left: 20,
            top: 50,
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF777E90),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  description,
                  style: const TextStyle(
                    color: Color(0xFF353945),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildImage() {
    return SizedBox(
      width: 200,
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: SvgPicture.asset(
              'assets/images/Ellipse1.svg',
              height: 130,
            ),
          ),
          Positioned(
            child: Image.asset(
              imagePath,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        const Text(
          'Show all',
          style: TextStyle(color: Color(0xFF9B9B9B), fontSize: 13, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}

class ListRecommendItemWidget extends StatefulWidget {
  const ListRecommendItemWidget({super.key});

  @override
  State<ListRecommendItemWidget> createState() => _ListRecommendItemWidgetState();
}

class _ListRecommendItemWidgetState extends State<ListRecommendItemWidget> {
  final List<ItemModel> _listItem = [
    ItemModel(
        imagePath: 'assets/images/recommend1.png',
        nameProduct: 'White fashion hoodie',
        price: '\$ 29.00'),
    ItemModel(
        imagePath: 'assets/images/recommend2.png',
        nameProduct: 'Cotton T-shirt',
        price: '\$ 30.00'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemBuilder: (context, index) {
          final item = _listItem[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  height: 100,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      item.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.nameProduct,
                      style: const TextStyle(
                        color: Color(0xFF1D1F22),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      item.price,
                      style: const TextStyle(
                        color: Color(0xFF1D1F22),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
        itemCount: _listItem.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class Banner2Widget extends StatelessWidget {
  const Banner2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8FA),
        borderRadius: BorderRadius.circular(20),
      ),
      height: 200,
      child: Stack(
        children: [
          Positioned(right: 0, child: _buildImage()),
          const Positioned(
            left: 20,
            top: 50,
            child: Column(
              children: [
                Text(
                  'NEW COLLECTION',
                  style: TextStyle(
                    color: Color(0xFF777E90),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'HANG OUT \n& PARTY',
                  style: TextStyle(
                    color: Color(0xFF353945),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildImage() {
    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: SvgPicture.asset(
              'assets/images/Ellipse1.svg',
              height: 180,
            ),
          ),
          Positioned(
            child: SvgPicture.asset(
              'assets/images/Ellipse2.svg',
              height: 130,
            ),
          ),
          Positioned(
            child: Image.asset(
              'assets/images/banner2.png',
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
              height: 200,
            ),
          ),
        ],
      ),
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
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'assets/images/main_banner.jpeg',
            fit: BoxFit.cover,
          ),
        ),
        const Positioned(
            right: 20,
            top: 30,
            child: Text(
              'Autumn\nCollection\n2021',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ))
      ],
    );
  }
}
