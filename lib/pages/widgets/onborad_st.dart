import 'package:flutter/material.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({
    Key? key,
    required this.image,
    required this.title,
    required this.discription,
  }) : super(key: key);
  final String image, title, discription;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(),
          Image.asset(
            image,
            height: 250,
            width: 250,
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.all(35),
            child: Text(
              discription,
              style: const TextStyle(
                height: 1.6,
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
