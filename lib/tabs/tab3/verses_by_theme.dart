import 'package:flutter/material.dart';

class VersesByTheme extends StatefulWidget {
  final ValueChanged<int> onPush;

  VersesByTheme({Key key, this.onPush}) : super(key: key);

  @override
  _VersesByThemeState createState() => _VersesByThemeState(onPush);

}

class _VersesByThemeState extends State<VersesByTheme> {
  final ValueChanged<int> onPush;

  _VersesByThemeState(this.onPush);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
