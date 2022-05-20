import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:portfolio/utils/constants.dart';

class PrincipalInformation extends StatelessWidget {
  const PrincipalInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Banner(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            TextDescription(label: "Test"),
            TextDescription(label: "Test"),
            TextDescription(label: "Test"),
            TextDescription(label: "Test"),
          ],
        ),
        Text(
          "My projects",
          style: Theme.of(context).textTheme.headline6,
        ),
        GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.3,
              crossAxisCount: 3,
              crossAxisSpacing: defaultPadding,
              mainAxisSpacing: defaultPadding,
            ),
            itemBuilder: (context, index) => Container(
                  color: secondaryColor,
                  padding: const EdgeInsets.all(defaultPadding),
                ))
      ],
    );
  }
}

class TextDescription extends StatelessWidget {
  final String label;
  const TextDescription({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AnimatedText(label: "+", value: 100),
        const SizedBox(width: defaultPadding / 2),
        Text(
          label,
          style: Theme.of(context).textTheme.subtitle1,
        )
      ],
    );
  }
}

class AnimatedText extends StatelessWidget {
  final double value;
  final String label;
  const AnimatedText({
    Key? key,
    required this.value,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0, end: value),
      duration: defaultDuration,
      builder: (context, value, child) => Text(
        "$value$label",
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: primaryColor),
      ),
    );
  }
}

class Banner extends StatelessWidget {
  const Banner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            "https://picsum.photos/1920/1080",
            fit: BoxFit.cover,
          ),
          Container(color: darkColor.withOpacity(0.75)),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome to my work",
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
                const AnimatedTextDescription(),
                const SizedBox(height: defaultPadding),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding * 2,
                      vertical: defaultPadding,
                    ),
                    backgroundColor: primaryColor,
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Explore now",
                    style: TextStyle(color: darkColor),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AnimatedTextDescription extends StatelessWidget {
  const AnimatedTextDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.subtitle1!,
      child: Row(
        children: [
          const Text.rich(
            TextSpan(
              text: "</>",
              style: TextStyle(color: primaryColor),
            ),
          ),
          const SizedBox(width: defaultPadding),
          AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                "Web Development",
                speed: const Duration(milliseconds: 60),
              ),
              TyperAnimatedText(
                "Dart and flutter",
                speed: const Duration(milliseconds: 60),
              ),
              TyperAnimatedText(
                "React and Redux",
                speed: const Duration(milliseconds: 60),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
