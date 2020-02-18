import 'package:flutter/material.dart';

class TextThemeTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Text Theme'),
      ),
      body: ListView(children: [
        Text(
          'headline',
          style: Theme.of(context).textTheme.headline,
        ),
        Text(
          '中文文字',
          style: Theme.of(context).textTheme.headline,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'title',
          style: Theme.of(context).textTheme.title,
        ),
        Text(
          '中文文字',
          style: Theme.of(context).textTheme.title,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'subhead',
          style: Theme.of(context).textTheme.subhead,
        ),
        Text(
          '中文文字',
          style: Theme.of(context).textTheme.subhead,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'subtitle',
          style: Theme.of(context).textTheme.subtitle,
        ),
        Text(
          '中文文字',
          style: Theme.of(context).textTheme.subtitle,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'body1',
          style: Theme.of(context).textTheme.body1,
        ),
        Text(
          '中文文字',
          style: Theme.of(context).textTheme.body1,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'body2',
          style: Theme.of(context).textTheme.body2,
        ),
        Text(
          '中文文字',
          style: Theme.of(context).textTheme.body2,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'button',
          style: Theme.of(context).textTheme.button,
        ),
        Text(
          '中文文字',
          style: Theme.of(context).textTheme.button,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'caption',
          style: Theme.of(context).textTheme.caption,
        ),
        Text(
          '中文文字',
          style: Theme.of(context).textTheme.caption,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'overline',
          style: Theme.of(context).textTheme.overline,
        ),
        Text(
          '中文文字',
          style: Theme.of(context).textTheme.overline,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'display1',
          style: Theme.of(context).textTheme.display1,
        ),
        Text(
          '中文文字',
          style: Theme.of(context).textTheme.display1,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'display2',
          style: Theme.of(context).textTheme.display2,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          '中文文字',
          style: Theme.of(context).textTheme.display2,
        ),
        Text(
          'display3',
          style: Theme.of(context).textTheme.display3,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          '中文文字',
          style: Theme.of(context).textTheme.display3,
        ),
        Text(
          'display4',
          style: Theme.of(context).textTheme.display4,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          '中文文字',
          style: Theme.of(context).textTheme.display4,
        ),
      ]));
}
