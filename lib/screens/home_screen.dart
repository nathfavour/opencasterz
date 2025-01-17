import 'package:flutter/material.dart';
import '../utils/responsive_layout.dart';
import '../utils/constants.dart';
import '../widgets/device_list.dart';
import '../widgets/cast_button.dart';
import '../widgets/side_menu.dart';

class _BuildFeaturedSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Featured Devices',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 8),
              Text('Discover and connect to nearby devices'),
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constants.headerHeight,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            'Dashboard',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {/* TODO: Implement search */},
          ),
        ],
      ),
    );
  }
}

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
