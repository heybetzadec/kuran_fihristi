import 'package:flutter/material.dart';
import 'package:kuranfihristi/tabs/controller/bottom_navigation.dart';
import 'package:kuranfihristi/tabs/controller/tab_navigator.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  TabItem _currentTab = TabItem.chapter;
  Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.chapter: GlobalKey<NavigatorState>(),
    TabItem.words: GlobalKey<NavigatorState>(),
    TabItem.theme: GlobalKey<NavigatorState>(),
    TabItem.names: GlobalKey<NavigatorState>(),
    TabItem.other: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_currentTab != TabItem.chapter) {
            // select 'main' tab
            _selectTab(TabItem.chapter);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.chapter),
          _buildOffstageNavigator(TabItem.words),
          _buildOffstageNavigator(TabItem.theme),
          _buildOffstageNavigator(TabItem.names),
          _buildOffstageNavigator(TabItem.other),
        ]),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
