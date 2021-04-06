import 'package:flutter/material.dart';

/// 抽屉组件
Drawer drawerWidget(BuildContext context) => Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: ListView(
              children: [
                Text(
                  'in东师，就用in东师',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('设置'),
            onTap: () {
              Navigator.pushNamed(context, '/setting');
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('关于'),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),
    );
