import 'package:flutter/material.dart';
import 'package:khelo/constatnts.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.1,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: size.height * 0.1,
            width: size.width * 0.8,
            color: Clrs.blackColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/kheloo-logo.png',
                  height: size.height * 0.08,
                  width: size.width * 0.4,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/promotions.jpg',
                        height: size.height * 0.06,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Promotions",
                        style: TextStyle(color: Clrs.yellowColor, fontSize: 8,),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: size.height * 0.1,
            width: size.width * 0.2,
            color: Colors.yellow,
            child: Center(
              child: Text(
                "Login".toUpperCase(),
                style: const TextStyle(color: Clrs.whiteColor, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}