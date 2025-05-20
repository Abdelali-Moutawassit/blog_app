import 'package:flutter/material.dart';

class HomeTest extends StatelessWidget {
  const HomeTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Home"),),),
      body: Center(child: Text("body"),),
    );
  }
}
