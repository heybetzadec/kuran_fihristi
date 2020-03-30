import 'package:flutter/material.dart';

class VerseList extends StatefulWidget {
  final ValueChanged<int> onPush;

  VerseList({Key key, this.onPush}) : super(key: key);

  @override
  _VerseListState createState() => _VerseListState(onPush);

}

class _VerseListState extends State<VerseList> {
  final ValueChanged<int> onPush;

  _VerseListState(this.onPush);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
