import 'package:flutter/material.dart';

class OnTapFunction extends StatelessWidget {
  const OnTapFunction({super.key, required this.function, required this.child});
  final Function() function;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: function,
      child: child,
    );
  }
}
