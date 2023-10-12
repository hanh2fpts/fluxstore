import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  static const String routeName = 'search_page';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<String> _listItemSuggest = ['Sunglasses', 'Sweater', 'Hoodie', 'Pant'];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                        ),
                      ),
                      hintText: 'Search',
                      hintStyle: MaterialStateProperty.all(const TextStyle(
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
              const SizedBox(height: 20),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Recent Searches
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Recent Searches'),
                        Icon(Icons.delete),
                      ],
                    ),
                    SizedBox(
                      height: 300,
                      child: Wrap(
                        spacing: 15,
                        children: List<Widget>.generate(4, (index) {
                          return RawChip(
                            label: Text(_listItemSuggest[index]),
                            selected: true,
                            avatar: const Icon(Icons.close),
                          );
                        }).toList(),
                      ),
                    )
                    //Popular
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}
