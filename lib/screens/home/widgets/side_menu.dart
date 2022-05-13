import 'package:flutter/material.dart';
import 'package:portfolio/screens/home/widgets/personal_information.dart';
import 'package:portfolio/utils/constants.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const PersonalInformation(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const AreaInfoText(
                    text: "Residence",
                    description: "Bogota, Colombia",
                  ),
                  const AreaInfoText(
                    text: "Age",
                    description: "25",
                  ),
                  const Divider(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Text(
                      "Skills",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Expanded(
                        child: AnimatedCircularProgressIndicator(
                          percentage: 0.7,
                          label: "JavaScript",
                        ),
                      ),
                      SizedBox(width: defaultPadding),
                      Expanded(
                        child: AnimatedCircularProgressIndicator(
                          percentage: 0.7,
                          label: "JavaScript",
                        ),
                      ),
                      SizedBox(width: defaultPadding),
                      Expanded(
                        child: AnimatedCircularProgressIndicator(
                          percentage: 0.7,
                          label: "JavaScript",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: defaultPadding),
                  const Divider(),
                  Text(
                    "Coding",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  const AnimatedLinearProgressIndicator(
                    label: "JavaScript",
                    percentage: 0.8,
                  ),
                  const AnimatedLinearProgressIndicator(
                    label: "Dart",
                    percentage: 0.65,
                  ),
                  const AnimatedLinearProgressIndicator(
                    label: "Java",
                    percentage: 0.55,
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Knowledge",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                  const KnowledgeDescription(label: "Web Development"),
                  const KnowledgeDescription(label: "Basic Testing"),
                  const KnowledgeDescription(label: "React and Redux"),
                  const Divider(),
                  TextButton(
                    onPressed: () {},
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Download CV",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(width: defaultPadding / 2),
                          Icon(
                            Icons.download,
                            color: Theme.of(context).textTheme.bodyText1!.color,
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding / 2),
                        onPressed: () {},
                        icon: Icon(
                          Icons.facebook,
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                      ),
                      IconButton(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding / 2),
                        onPressed: () {},
                        icon: Icon(
                          Icons.web,
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class KnowledgeDescription extends StatelessWidget {
  final String label;
  const KnowledgeDescription({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.check,
            color: primaryColor,
          ),
          const SizedBox(width: defaultPadding),
          Text(label),
        ],
      ),
    );
  }
}

class AnimatedLinearProgressIndicator extends StatelessWidget {
  final double percentage;
  final String label;

  const AnimatedLinearProgressIndicator({
    Key? key,
    required this.percentage,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: percentage),
        duration: defaultDuration,
        builder: (context, double value, child) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: const TextStyle(color: Colors.white),
                ),
                Text((value * 100).toInt().toString() + "%")
              ],
            ),
            const SizedBox(height: defaultPadding / 2),
            LinearProgressIndicator(
              value: value,
              color: primaryColor,
              backgroundColor: darkColor,
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedCircularProgressIndicator extends StatelessWidget {
  final double percentage;
  final String label;
  const AnimatedCircularProgressIndicator({
    Key? key,
    required this.percentage,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: percentage),
            duration: defaultDuration,
            builder: (context, double value, child) => Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: value,
                  color: primaryColor,
                  backgroundColor: darkColor,
                ),
                Center(
                  child: Text(
                    (value * 100).toInt().toString() + "%",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: defaultPadding / 2),
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.subtitle2,
        )
      ],
    );
  }
}

class AreaInfoText extends StatelessWidget {
  final String text, description;
  const AreaInfoText({
    Key? key,
    required this.text,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
        Text(description)
      ]),
    );
  }
}
