import 'package:flutter/material.dart';

/// 抽屉组件
Drawer Function(BuildContext) drawerWidget = (context) => Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: ListView(
              children: [
                Text(
                  'in东师',
                  style: Theme.of(context).textTheme.display1,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '行遍千山万水，归来仍是——',
                  style: Theme.of(context).textTheme.body1,
                ),
                Text(
                  '东师青年',
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.subhead,
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: const Text('设置'),
            onTap: () {
              Navigator.pushNamed(context, '/setting');
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: const Text('关于'),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),
    );
