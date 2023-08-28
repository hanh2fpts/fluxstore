import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxstore/model/intro_model.dart';
import 'package:fluxstore/model/item_model.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
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
                height: 180,
                imagePath: 'assets/images/item_product_3.png',
              ),
              SizedBox(
                height: 20,
              ),
              Banner3Widget(
                title: 'Summer Collection 2023',
                description: 'Most sexy\n& fabulous\ndesign',
                height: 200,
                imagePath: 'assets/images/banner3_2.png',
              ),
              SizedBox(
                height: 20,
              ),
              BottomWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ItemModel> listItem = [
      ItemModel(
          imagePath: 'assets/images/bottom_image1.png',
          nameProduct: 'T-Shirts',
          price: 'The \nOffice\nLife'),
      ItemModel(
          imagePath: 'assets/images/bottom_image2.png',
          nameProduct: 'Dresses',
          price: 'Elegant\nDesign'),
    ];
    return SizedBox(
      height: 250,
      child: ListView.builder(
        itemCount: listItem.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = listItem[index];
          return Container(
              margin: const EdgeInsets.only(right: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F8FA),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    item.imagePath,
                    filterQuality: FilterQuality.high,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.nameProduct,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        item.price,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      )
                    ],
                  )
                ],
              ));
        },
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
            top: 30,
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
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
                    color: Colors.black,
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
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
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
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      item.price,
                      style: const TextStyle(
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
                    color: Colors.black,
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
                    color: Colors.black,
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
        imagePath: 'assets/images/bottom_image1.png',
        nameProduct: 'Turtleneck Sweater',
        price: '\$ 39.99'),
    ItemModel(
        imagePath: 'assets/images/bottom_image2.png',
        nameProduct: 'Long Sleeve Dress',
        price: '\$ 45.00'),
    ItemModel(
      imagePath: 'assets/images/item_product_3.png',
      nameProduct: 'Sportwear Set',
      price: '\$ 80.00',
    ),
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
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  _listItem[index].price,
                  style: const TextStyle(
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

class MainBannerWidget extends StatefulWidget {
  const MainBannerWidget({super.key});

  @override
  State<MainBannerWidget> createState() => _MainBannerWidgetState();
}

class _MainBannerWidgetState extends State<MainBannerWidget> {
  final List<IntroModel> _listIntro = [
    IntroModel(
      imagePath: 'assets/images/main_banner.jpeg',
      title: 'Autumn\nCollection\n2023',
      description: '',
    ),
    IntroModel(
      imagePath: 'assets/images/item_product_1.jpeg',
      title: 'Autumn\nCollection\n2023',
      description: '',
    ),
    IntroModel(
      imagePath: 'assets/images/item_product_2.png',
      title: 'Autumn\nCollection\n2023',
      description: '',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        enableInfiniteScroll: true,
        scrollDirection: Axis.horizontal,
        enlargeCenterPage: true,
        autoPlay: true,
        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
        onPageChanged: (index, reason) {
          setState(() {});
        },
      ),
      itemCount: _listIntro.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        final item = _listIntro[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Banner(
            imagePath: item.imagePath,
            title: item.title,
          ),
        );
      },
    );
  }
}

class Banner extends StatelessWidget {
  const Banner({
    super.key,
    required this.imagePath,
    required this.title,
  });
  final String imagePath;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            right: 20,
            top: 30,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ))
      ],
    );
  }
}
