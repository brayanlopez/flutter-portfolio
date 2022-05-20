import 'package:flutter/material.dart';
import 'package:portfolio/screens/home/principal_information.dart';
import 'package:portfolio/screens/home/widgets/side_menu.dart';
import 'package:portfolio/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  final List<Widget> children;
  const HomeScreen({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: maxWidth),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 2,
                child: SideMenu(),
              ),
              const SizedBox(width: defaultPadding),
              Expanded(
                flex: 7,
                child: SingleChildScrollView(
                    child: Column(
                  children: const [
                    PrincipalInformation(),
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
