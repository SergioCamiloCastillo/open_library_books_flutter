import 'package:bookstore_flutter/presentation/widgets/widgets.dart';
import 'package:bookstore_flutter/presentation/screens/screens.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  final Widget childView;
  const HomeScreen({super.key, required this.childView});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: childView,
      extendBody: true,  // This line ensures the Scaffold body extends behind the navigation bar
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}