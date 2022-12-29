import 'package:flutter/material.dart';
import 'package:foodapp/widgets/FirstHalf.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [FirstHalf()],
          ),
        ),
      ),
    );
  }
}
