import 'package:flutter/material.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(flex: 2),
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  "https://as01.epimg.net/meristation/imagenes/2021/01/20/noticias/1611162270_013847_1611162672_noticia_normal_recorte1.jpg"),
            ),
            const Spacer(),
            Text(
              "Brayan López",
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const Text(
              "Front-end Developer",
              style: TextStyle(height: 1.5, fontWeight: FontWeight.w200),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
