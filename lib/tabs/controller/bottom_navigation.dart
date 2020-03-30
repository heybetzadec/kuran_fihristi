import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum TabItem { sura, words, theme, names, other }

Map<TabItem, String> tabName = {
  TabItem.sura: 'Sura',
  TabItem.words: 'Words',
  TabItem.theme: 'Theme',
  TabItem.names: 'Names',
  TabItem.other: 'Other',
};


Map<TabItem, IconData> tabIcons = {
  TabItem.sura: FontAwesomeIcons.bookOpen,
  TabItem.words: FontAwesomeIcons.tag,
  TabItem.theme: FontAwesomeIcons.inbox,
  TabItem.names: FontAwesomeIcons.bookmark,
  TabItem.other: FontAwesomeIcons.cog,
};

Map<TabItem, MaterialColor> activeTabColor = {
  TabItem.sura: Colors.red,
  TabItem.words: Colors.green,
  TabItem.theme: Colors.blue,
  TabItem.names: Colors.green,
  TabItem.other: Colors.blue,
};

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(tabItem: TabItem.sura),
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
    IconData icon = Icons.layers;
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