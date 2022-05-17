import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String? gambarSrc;
  final String? title;
  final Function()? press;
  const CategoryCard({
    Key? key,
    this.gambarSrc,
    this.title,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.yellow, width: 2),
          // boxShadow: [
          //   BoxShadow(
          //     offset: Offset(5, 5),
          //     blurRadius: 90,
          //     spreadRadius: 10,
          //     color: Colors.grey,
          //   ),
          // ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Image.asset(gambarSrc!),
                  Spacer(),
                  Text(title!,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
