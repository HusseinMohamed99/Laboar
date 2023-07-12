import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({required this.os, Key? key}) : super(key: key);
  final String os;
  @override
  Widget build(BuildContext context) {
    if (os == 'android') {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
        ),
      );
    }

    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }
}
