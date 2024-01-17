import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class FindJobScreen extends StatefulWidget {
  const FindJobScreen({super.key});

  @override
  State<FindJobScreen> createState() => _FindJobScreenState();
}

class _FindJobScreenState extends State<FindJobScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: "Job".text.make()),
    );
  }
}