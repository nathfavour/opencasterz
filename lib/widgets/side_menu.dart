import 'package:flutter/material.dart';
import '../utils/constants.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Theme.of(context).cardColor,
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: Text(
                Constants.appName,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          _BuildMenuItem(
            icon: Icons.home,
            title: 'Home',
            isSelected: true,
          ),
          _BuildMenuItem(
            icon: Icons.search,
            title: 'Search',
          ),
          _BuildMenuItem(
            icon: Icons.settings,
            title: 'Settings',
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(16),
            child: CastButton(),
          ),
        ],
      ),
    );
  }
}

class _BuildMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;

  const _BuildMenuItem({
    required this.icon,
    required this.title,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: isSelected ? Constants.primaryColor : null),
      title: Text(title),
      selected: isSelected,
      onTap: () {/* TODO: Handle navigation */},
    );
  }
}
