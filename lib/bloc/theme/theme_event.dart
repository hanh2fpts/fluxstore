part of 'theme_bloc.dart';

abstract class ThemeEvent {}

class InitThemeEvent extends ThemeEvent {}

class ChangeColorThemeEvent extends ThemeEvent {
  final int mainColor;
  ChangeColorThemeEvent({required this.mainColor});
}

class ChangeThemeEvent extends ThemeEvent {
  final bool turnOnDarkTheme;
  ChangeThemeEvent({required this.turnOnDarkTheme});
}
