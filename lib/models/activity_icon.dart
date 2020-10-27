import 'package:flutter/material.dart';

class ActivityIcon extends StatelessWidget {
  final String image;
  final String name;
  final Color color;
  ActivityIcon(
    this.image,
    this.name,
    this.color,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  color: color,
                  height: 55,
                  width: 55,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  child: Image.asset(
                    image,
                    height: 55,
                    width: 55,
                  ),
                ),
              ),
            ],
          ),
          Text(name)
        ],
      ),
    );
  }
}
