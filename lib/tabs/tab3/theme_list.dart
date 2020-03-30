import 'package:flutter/material.dart';

class ThemeList extends StatefulWidget {
  final ValueChanged<int> onPush;

  ThemeList({Key key, this.onPush}) : super(key: key);

  @override
  _ThemeListState createState() => _ThemeListState(onPush);

}

class _ThemeListState extends State<ThemeList> {
  final ValueChanged<int> onPush;

  _ThemeListState(this.onPush);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
