import 'package:flutter/material.dart';
import 'package:portfolio/screens/home/widgets/side_menu.dart';
import 'package:portfolio/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: maxWidth),
          child: Row(
            children: [
              const Expanded(
                flex: 2,
                child: SideMenu(),
              ),
              Expanded(flex: 7, child: Container(color: Colors.blue)),
            ],
          ),
        ),
      ),
    );
  }
}
