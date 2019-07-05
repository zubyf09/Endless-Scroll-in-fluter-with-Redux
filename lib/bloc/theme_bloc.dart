import 'dart:async';
import 'package:upday_assignment/configs/themes.dart';

class ThemeBloc {
  final StreamController<Themes> _themeController = StreamController<Themes>();
  get changeTheme => _themeController.sink.add;
  get themeEnabled => _themeController.stream;
}

final themeBloc = ThemeBloc();
