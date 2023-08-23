import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxstore/presentation/discover/search_page.dart';
import 'package:fluxstore/presentation/menu_page.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 45,
          width: size.width * 2 / 3,
          child: ElevatedButton.icon(
            style: const ButtonStyle(alignment: Alignment.centerLeft),
            label: const Text(
              'Search',
              style: TextStyle(
                color: Color(0xFF777E90),
                fontSize: 16,
              ),
            ),
            icon: const Icon(
              Icons.search,
              color: Color(0xFF777E90),
            ),
            onPressed: () => Navigator.of(context).pushNamed(SearchPage.routeName),
          ),
        ),
        SizedBox(
          height: 45,
          width: 60,
          child: ElevatedButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Set your desired radius
                  ),
                )),
            onPressed: () => Navigator.of(context).pushNamed(MenuPage.routeName),
            child: SvgPicture.asset('assets/icons/icon_filter.svg'),
          ),
        )
      ],
    );
  }
}