import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxstore/app_config/app_config.dart';
import 'package:fluxstore/bloc/theme/theme_bloc.dart';
import 'package:fluxstore/presentation/sidebar/about_page.dart';
import 'package:fluxstore/presentation/home/home_page.dart';
import 'package:fluxstore/presentation/setting/setting_page.dart';
import 'package:fluxstore/presentation/sidebar/support_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});
  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> with AutomaticKeepAliveClientMixin<MenuPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return NavigationDrawer(
      onDestinationSelected: (value) {
        AppConfig.currentIndex = value;
        switch (value) {
          case 0:
            Navigator.of(context).pushReplacementNamed(HomePage.routeName);
          case 1:
            Navigator.of(context).pushReplacementNamed(HomePage.routeName);
          case 2:
            Navigator.of(context).pushReplacementNamed(HomePage.routeName);
          case 3:
            Navigator.of(context).pushReplacementNamed(HomePage.routeName);
          case 4:
            Navigator.of(context).pushReplacementNamed(SettingPage.routeName);
          case 5:
            Navigator.of(context).pushReplacementNamed(SupportPage.routeName);
          case 6:
            Navigator.of(context).pushReplacementNamed(AboutPage.routeName);
        }
      },
      selectedIndex: AppConfig.currentIndex,
      children: const [
        SizedBox(
          height: 100,
          child: Row(
            children: [
              Spacer(),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.jpeg'),
                radius: 30,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sunie Pham',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'sunieux@gmail.com',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              Spacer(),
            ],
          ),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.home_filled),
          label: Text(
            'Homepage',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.search),
          label: Text(
            'Discover',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.badge),
          label: Text(
            'My Order',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.person),
          label: Text(
            'My Profile',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Text(
            'OTHER',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.settings),
          label: Text(
            'Setting',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.email_outlined),
          label: Text(
            'Support',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.info_outline),
          label: Text(
            'About us',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: SwitchDarkThemeWidget(),
        ),
      ],
    );
  }
}

class SwitchDarkThemeWidget extends StatelessWidget {
  const SwitchDarkThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) => Column(
        children: [
          Container(
            width: 227,
            height: 37,
            padding: const EdgeInsets.all(4),
            decoration: ShapeDecoration(
              color: state.isDarkTheme ? Colors.black12 : Colors.grey.shade200,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () =>
                        context.read<ThemeBloc>().add(ChangeThemeEvent(turnOnDarkTheme: false)),
                    child: Container(
                      height: 30,
                      padding: const EdgeInsets.only(top: 4, left: 8, right: 16, bottom: 4),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: state.isDarkTheme ? null : theme.inversePrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        shadows: state.isDarkTheme
                            ? null
                            : [
                                BoxShadow(
                                  color: theme.inversePrimary,
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                  spreadRadius: -4,
                                )
                              ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 21,
                            height: 22,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Light',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Product Sans Medium',
                              fontWeight: FontWeight.w400,
                              height: 0.10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: GestureDetector(
                    onTap: () =>
                        context.read<ThemeBloc>().add(ChangeThemeEvent(turnOnDarkTheme: true)),
                    child: Container(
                      height: 30,
                      padding: const EdgeInsets.only(top: 4, left: 8, right: 16, bottom: 4),
                      decoration: ShapeDecoration(
                        color: state.isDarkTheme ? theme.inversePrimary : null,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        shadows: state.isDarkTheme
                            ? [
                                BoxShadow(
                                  color: theme.inversePrimary,
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                  spreadRadius: -4,
                                )
                              ]
                            : null,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 22,
                            height: 22,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Dark',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Product Sans Medium',
                              fontWeight: FontWeight.w400,
                              height: 0.10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          const ColorThemeWidget()
        ],
      ),
    );
  }
}

class ColorThemeWidget extends StatefulWidget {
  const ColorThemeWidget({
    super.key,
  });
  @override
  State<ColorThemeWidget> createState() => _ColorThemeWidgetState();
}

class _ColorThemeWidgetState extends State<ColorThemeWidget> {
  bool isChoseColor1 = true;
  bool isChoseColor2 = false;
  bool isChoseColor3 = false;
  bool isChoseColor4 = false;
  @override
  void initState() {
    super.initState();
  }

  Future getColorTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int color = prefs.getInt('color') ?? 0xFF4CAF50;
    if (color == 0xFF4CAF50) {
      isChoseColor1 = true;
      isChoseColor2 = false;
      isChoseColor3 = false;
      isChoseColor4 = false;
    } else if (color == 0xFF2196F3) {
      isChoseColor2 = true;
      isChoseColor1 = false;
      isChoseColor3 = false;
      isChoseColor4 = false;
    } else if (color == 0xFFE91E63) {
      isChoseColor3 = true;
      isChoseColor2 = false;
      isChoseColor1 = false;
      isChoseColor4 = false;
    } else if (color == 0xFF3F51B5) {
      isChoseColor4 = true;
      isChoseColor2 = false;
      isChoseColor3 = false;
      isChoseColor1 = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getColorTheme(),
        builder: (context, snapshot) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isChoseColor1 = true;
                    isChoseColor2 = false;
                    isChoseColor3 = false;
                    isChoseColor4 = false;
                  });
                  context.read<ThemeBloc>().add(ChangeColorThemeEvent(mainColor: 0xFF4CAF50));
                },
                child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration:
                        const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF1B5E20)),
                    child: CircleAvatar(
                      backgroundColor: const Color(0xFF4CAF50),
                      radius: 20,
                      child: isChoseColor1 ? const Icon(Icons.check) : null,
                    )),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isChoseColor2 = true;
                    isChoseColor1 = false;
                    isChoseColor3 = false;
                    isChoseColor4 = false;
                  });
                  context.read<ThemeBloc>().add(ChangeColorThemeEvent(mainColor: 0xFF2196F3));
                },
                child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration:
                        const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF0D47A1)),
                    child: CircleAvatar(
                      backgroundColor: const Color(0xFF2196F3),
                      radius: 20,
                      child: isChoseColor2 ? const Icon(Icons.check) : null,
                    )),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isChoseColor3 = true;
                    isChoseColor2 = false;
                    isChoseColor1 = false;
                    isChoseColor4 = false;
                  });
                  context.read<ThemeBloc>().add(ChangeColorThemeEvent(mainColor: 0xFFE91E63));
                },
                child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration:
                        const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF880E4F)),
                    child: CircleAvatar(
                      backgroundColor: const Color(0xFFE91E63),
                      radius: 20,
                      child: isChoseColor3 ? const Icon(Icons.check) : null,
                    )),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isChoseColor4 = true;
                    isChoseColor2 = false;
                    isChoseColor3 = false;
                    isChoseColor1 = false;
                  });
                  context.read<ThemeBloc>().add(ChangeColorThemeEvent(mainColor: 0xFF3F51B5));
                },
                child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration:
                        const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF1A237E)),
                    child: CircleAvatar(
                      backgroundColor: const Color(0xFF3F51B5),
                      radius: 20,
                      child: isChoseColor4 ? const Icon(Icons.check) : null,
                    )),
              ),
            ],
          );
        });
  }
}
