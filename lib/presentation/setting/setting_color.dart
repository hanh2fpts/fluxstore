import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bloc/theme/theme_bloc.dart';

class SettingColor extends StatelessWidget {
  const SettingColor({super.key});

  static const String routeName = 'setting_color';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Theme',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.sunny),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      'Turn on dark theme',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    CupertinoSwitch(
                      applyTheme: true,
                      value: state.isDarkTheme,
                      onChanged: (value) {
                        context.read<ThemeBloc>().add(ChangeThemeEvent(turnOnDarkTheme: value));
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const ColorThemeWidget()
              ],
            ),
          );
        },
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
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF1B5E20)),
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
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF0D47A1)),
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
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF880E4F)),
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
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF1A237E)),
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
