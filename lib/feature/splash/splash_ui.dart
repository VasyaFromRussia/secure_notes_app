import 'package:flutter/material.dart';
import 'package:secure_notes/feature/resources/strings.dart';
import 'package:secure_notes/utils/resources.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          child: Center(
            child: Text(
              AppStrings.splashTitle,
              style: context.textTheme.headline4?.copyWith(color: context.theme.backgroundColor),
            ),
          ),
        ),
      );
}
