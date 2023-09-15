import 'package:flutter/material.dart';


class CategoryWidget extends StatelessWidget {
  const CategoryWidget(
      {super.key, required this.title, required this.img, required this.press});

  final String title;
  final String img;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 5,
              )
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              onTap: press,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    Image.network(img),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}