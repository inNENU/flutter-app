import 'package:flutter/material.dart';

class TextThemeTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Text Theme'),
        ),
        body: ListView(
          children: [
            Text(
              'subtitle1',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              '中文文字',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'subtitle2',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Text(
              '中文文字',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'bodyText1',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              '中文文字',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              'bodyText2',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              '中文文字',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(
              height: 15,
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
              'headline6',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              '中文文字',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'headline5',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              '中文文字',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'headline4',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '中文文字',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 15,
            ),
            Text('headline3', style: Theme.of(context).textTheme.headline3),
            const SizedBox(
              height: 15,
            ),
            Text(
              '中文文字',
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              'headline2',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '中文文字',
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              'headline1',
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '中文文字',
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      );
}
