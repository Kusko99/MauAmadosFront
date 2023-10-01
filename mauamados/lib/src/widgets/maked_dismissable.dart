import 'package:flutter/material.dart';

class MakeDismissable extends StatelessWidget {
  final Widget child;

  const MakeDismissable({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(),
      child: GestureDetector(
        onTap: () {},
        child: child,
      ),
    );
  }
}
