import 'package:flutter/material.dart';

class WordList extends StatefulWidget {
  final ValueChanged<int> onPush;

  WordList({Key key, this.onPush}) : super(key: key);

  @override
  _WordListState createState() => _WordListState(onPush);

}

class _WordListState extends State<WordList> {
  final ValueChanged<int> onPush;

  _WordListState(this.onPush);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
