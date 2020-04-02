import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kuranfihristi/help/event_key.dart';
import 'package:kuranfihristi/help/route_bus.dart';
import 'package:kuranfihristi/help/translations.dart';

enum TabItem { chapter, words, theme, names, other }

Map<TabItem, String> tabName = {
  TabItem.chapter: 'Surələr',
  TabItem.words: 'Words',
  TabItem.theme: 'Theme',
  TabItem.names: 'Names',
  TabItem.other: 'Other',
};

Map<TabItem, IconData> tabIcons = {
  TabItem.chapter: FontAwesomeIcons.bookOpen,
  TabItem.words: FontAwesomeIcons.tag,
  TabItem.theme: FontAwesomeIcons.inbox,
  TabItem.names: FontAwesomeIcons.bookmark,
  TabItem.other: FontAwesomeIcons.cog,
};

Map<TabItem, MaterialColor> activeTabColor = {
  TabItem.chapter: Colors.blue,
  TabItem.words: Colors.blue,
  TabItem.theme: Colors.blue,
  TabItem.names: Colors.blue,
  TabItem.other: Colors.blue,
};

class BottomNavigation extends StatefulWidget {
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;
  final RouteBus routeBus;

  BottomNavigation({Key key, this.routeBus, this.currentTab, this.onSelectTab}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState(routeBus, currentTab, onSelectTab);
}

class _BottomNavigationState extends State<BottomNavigation> {
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;
  final RouteBus routeBus;

  _BottomNavigationState(this.routeBus, this.currentTab, this.onSelectTab);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    tabName = {
      TabItem.chapter: Translations.of(context).text("chapters"),
      TabItem.words: Translations.of(context).text("words"),
      TabItem.theme: Translations.of(context).text("themes"),
      TabItem.names: Translations.of(context).text("names"),
      TabItem.other: Translations.of(context).text("other"),
    };


    routeBus.eventBus.on<BottomNavEvent>().listen((event) {
      Translations.load(Locale(event.value)).then((value) {
        print('event.value = ${event.value}');
        var translate = value.all();
        setState(() {
          tabName = {
            TabItem.chapter: translate["chapters"],
            TabItem.words: translate["words"],
            TabItem.theme: translate["themes"],
            TabItem.names: translate["names"],
            TabItem.other: translate["other"],
          };
        });
      });
    });

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(tabItem: TabItem.chapter),
        _buildItem(tabItem: TabItem.words),
        _buildItem(tabItem: TabItem.theme),
        _buildItem(tabItem: TabItem.names),
        _buildItem(tabItem: TabItem.other),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
    );
  }

  BottomNavigationBarItem _buildItem({TabItem tabItem}) {
    String text = tabName[tabItem];
    return BottomNavigationBarItem(
      icon: Icon(
        tabIcons[tabItem],
        color: _colorTabMatching(item: tabItem),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _colorTabMatching(item: tabItem),
        ),
      ),
    );
  }

  Color _colorTabMatching({TabItem item}) {
    return currentTab == item ? activeTabColor[item] : Colors.grey;
  }
}
