import 'package:flutter/material.dart';

class TextThemeTest extends StatelessWidget {
  const TextThemeTest({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Text Theme'),
        ),
        body: ListView(
          children: [
            Text(
              'titleMedium',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              '中文文字',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'titleSmall',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              '中文文字',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'bodyLarge',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              '中文文字',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'bodyMedium',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '中文文字',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'bodySmall',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              '中文文字',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'button',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              '中文文字',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'caption',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              '中文文字',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'overline',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Text(
              '中文文字',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'headline6',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              '中文文字',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'headline5',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              '中文文字',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              'headline4',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              '中文文字',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 15,
            ),
            Text('headline3', style: Theme.of(context).textTheme.displaySmall),
            const SizedBox(
              height: 15,
            ),
            Text(
              '中文文字',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              'headline2',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '中文文字',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              'headline1',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '中文文字',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        ),
      );
}
