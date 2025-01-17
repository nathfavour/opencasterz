import 'package:flutter/material.dart';
import '../utils/responsive_layout.dart';
import '../utils/constants.dart';
import '../widgets/device_list.dart';
import '../widgets/cast_button.dart';
import '../widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _MobileLayout(),
      desktop: _DesktopLayout(),
    );
  }
}

class _MobileLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.appName),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {/* TODO: Implement search */},
          ),
        ],
      ),
      body: Column(
        children: [
          _BuildFeaturedSection(),
          Expanded(child: DeviceList()),
          CastButton(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: 0,
        onTap: (index) {/* TODO: Handle navigation */},
      ),
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideMenu(),
          Expanded(
            child: Column(
              children: [
                _BuildHeader(),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: _BuildFeaturedSection(),
                      ),
                      Expanded(
                        flex: 3,
                        child: DeviceList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
