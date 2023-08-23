import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxstore/model/discover_model.dart';
import 'package:fluxstore/presentation/widget/custom_expansion_widget.dart';
import 'package:fluxstore/presentation/widget/search_bar_widget.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SearchBarWidget(),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomExpansionPanel(
                    header: AdvertisementWidget(
                      backgroundColor: Color(0xFFA3A798),
                      imagePath: 'assets/images/discover_banner4.png',
                      title: 'CLOTHING',
                    ),
                    body: DetailsItemWidget(),
                  ),
                  CustomExpansionPanel(
                    header: AdvertisementWidget(
                      backgroundColor: Color(0xFF898280),
                      imagePath: 'assets/images/discover_banner4.png',
                      title: 'ACCESSORIES',
                    ),
                    body: DetailsItemWidget(),
                  ),
                  CustomExpansionPanel(
                    header: AdvertisementWidget(
                      backgroundColor: Color(0xFF44565C),
                      imagePath: 'assets/images/discover_banner4.png',
                      title: 'SHOES',
                    ),
                    body: DetailsItemWidget(),
                  ),
                  CustomExpansionPanel(
                    header: AdvertisementWidget(
                      backgroundColor: Color(0xFFB9AEB2),
                      imagePath: 'assets/images/discover_banner4.png',
                      title: 'COLLECTION',
                    ),
                    body: DetailsItemWidget(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsItemWidget extends StatelessWidget {
  const DetailsItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DiscoverModel> listItem = [
      DiscoverModel(title: 'Jacket', amountItem: '128 items'),
      DiscoverModel(title: 'Skirts', amountItem: '40 items'),
      DiscoverModel(title: 'Dresses', amountItem: '36 items'),
      DiscoverModel(title: 'Sweaters', amountItem: '24 items'),
      DiscoverModel(title: 'Jeans', amountItem: '14 items'),
      DiscoverModel(title: 'T-Shirts', amountItem: '12 items'),
      DiscoverModel(title: 'Pants', amountItem: '9 items'),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: ListView.separated(
        itemCount: listItem.length,
        shrinkWrap: true,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          var item = listItem[index];
          return SizedBox(
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Text(
                  item.amountItem,
                  style: const TextStyle(
                    color: Color(0xFFA3A5AD),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class AdvertisementWidget extends StatelessWidget {
  const AdvertisementWidget(
      {super.key, required this.backgroundColor, required this.imagePath, required this.title});
  final Color backgroundColor;
  final String imagePath;
  final String title;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        height: 150,
        width: size.width - 40,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: _FrameWidget(imagePath: imagePath),
              ),
            ),
          ],
        ));
  }
}

class _FrameWidget extends StatelessWidget {
  const _FrameWidget({
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      alignment: Alignment.center,
      children: [
        Positioned(
          child: SvgPicture.asset(
            'assets/images/Ellipse1.svg',
            height: 150,
          ),
        ),
        Positioned(
          child: SvgPicture.asset(
            'assets/images/Ellipse2.svg',
            height: 100,
          ),
        ),
        Positioned(
          child: Image.asset(
            imagePath,
            filterQuality: FilterQuality.high,
            fit: BoxFit.fitHeight,
          ),
        ),
      ],
    );
  }
}
