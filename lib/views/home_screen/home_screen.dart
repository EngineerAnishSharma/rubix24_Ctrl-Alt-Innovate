import 'package:flutter/material.dart';
import 'package:tsec_hack/consts/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: whiteColor,
      body: Center(child: Text("Home Screen")),
    );
  }
}
