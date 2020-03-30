import 'package:flutter/material.dart';

class VersesByWord extends StatefulWidget {
  final ValueChanged<int> onPush;

  VersesByWord({Key key, this.onPush}) : super(key: key);

  @override
  _VersesByWordState createState() => _VersesByWordState(onPush);

}

class _VersesByWordState extends State<VersesByWord> {
  final ValueChanged<int> onPush;

  _VersesByWordState(this.onPush);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
