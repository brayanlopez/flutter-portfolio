import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:portfolio/models/project.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/responsive.dart';

class PrincipalInformation extends StatelessWidget {
  const PrincipalInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Banner(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const TextDescription(label: "Test"),
            const TextDescription(label: "Test"),
            if (Responsive.isDesktop(context))
              const TextDescription(label: "Test"),
            if (Responsive.isDesktop(context))
              const TextDescription(label: "Test"),
          ],
        ),
        const Responsive(
          mobile: MyProjects(crossAxisCount: 1, childAspectRatio: 2),
          mobileLarge: MyProjects(crossAxisCount: 2),
          tablet: MyProjects(childAspectRatio: 1.1),
          desktop: MyProjects(),
        ),
        const Recommendations()
      ],
    );
  }
}

class Recommendations extends StatelessWidget {
  const Recommendations({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Column(
        children: [
          Text(
            "Recommendations",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: defaultPadding),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                5,
                (index) => const Padding(
                  padding: EdgeInsets.only(right: defaultPadding),
                  child: RecommendationCard(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      color: secondaryColor,
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Title recommendation",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          const Text("Link recommendation"),
          const SizedBox(height: defaultPadding),
          Text(
            "Description recommendation, Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet",
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}

class MyProjects extends StatelessWidget {
  final int crossAxisCount;
  final double childAspectRatio;
  const MyProjects({
    Key? key,
    this.crossAxisCount = 3,
    this.childAspectRatio = 1.3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "My projects",
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: defaultPadding),
        GridView.builder(
          shrinkWrap: true,
          itemCount: 9,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: childAspectRatio,
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: defaultPadding,
            mainAxisSpacing: defaultPadding,
          ),
          itemBuilder: (context, index) => ProjectCard(
            project: Project(),
          ),
        ),
      ],
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: secondaryColor,
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          Text(
            "Project title example",
            style: Theme.of(context).textTheme.subtitle2,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          const Text(
            "Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet ",
            style: TextStyle(height: 1.5),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          TextButton(onPressed: () {}, child: const Text("Read more>>"))
        ],
      ),
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
                  style: Responsive.isDesktop(context)
                      ? Theme.of(context).textTheme.headline3!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )
                      : Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                ),
                if (Responsive.isMobileLarge(context))
                  const SizedBox(height: defaultPadding / 2),
                const AnimatedTextDescription(),
                const SizedBox(height: defaultPadding),
                if (!Responsive.isMobileLarge(context))
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
          if (!Responsive.isMobileLarge(context))
            const Text.rich(
              TextSpan(
                text: "</>",
                style: TextStyle(color: primaryColor),
              ),
            ),
          if (!Responsive.isMobileLarge(context))
            const SizedBox(width: defaultPadding / 2),
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
