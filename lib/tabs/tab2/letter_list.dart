import 'package:flutter/material.dart';

class LetterList extends StatefulWidget {
  final ValueChanged<int> onPush;

  LetterList({Key key, this.onPush}) : super(key: key);

  @override
  _LetterListState createState() => _LetterListState(onPush);

}

class _LetterListState extends State<LetterList> {
  final ValueChanged<int> onPush;

  _LetterListState(this.onPush);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
