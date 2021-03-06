import 'package:flutter/material.dart';
import 'package:secure_notes/utils/resources.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) => Material(
        color: context.theme.backgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: child,
        ),
      );
}

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: CircularProgressIndicator(),
      );
}
