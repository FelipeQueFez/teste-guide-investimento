import 'package:flutter/material.dart';

class GuideScaffold extends StatelessWidget {
  final Widget child;
  final AppBar? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Color? backgroundColor;

  GuideScaffold({
    Key? key,
    required this.child,
    this.bottomNavigationBar,
    this.appBar,
    this.backgroundColor,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Theme.of(context).backgroundColor,
      appBar: appBar,
      body: child,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }
}
