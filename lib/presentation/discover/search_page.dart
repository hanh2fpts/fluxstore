import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  static const String routeName = 'search_page';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * 2 / 3,
                    height: 45,
                    child: SearchBar(
                      elevation: MaterialStateProperty.all(2.0),
                      leading: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.search,
                          color: Color(0xFF777E90),
                        ),
                      ),
                      hintText: 'Search',
                      hintStyle: MaterialStateProperty.all(const TextStyle(
                        color: Color(0xFF777E90),
                        fontSize: 16,
                      )),
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
                      onPressed: () {},
                      child: SvgPicture.asset('assets/icons/icon_filter.svg'),
                    ),
                  )
                ],
              ),
            ),
            const Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  // Recent Searches
                  Row()
                  //Popular
                ],
              ),
            ))
          ],
        ));
  }
}
