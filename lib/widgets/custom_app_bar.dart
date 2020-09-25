import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/assets.dart';
import 'package:flutter_netflix_responsive_ui/constant.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key key, this.scrollOffset = 0.0}) : super(key: key);
  final double scrollOffset;
  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(Assets.netflixLogo0),
              SizedBox(
                width: 12.0,
              ),
              GestureDetector(
                child: Text('TV Show', style: Constant.textWithBold),
                onTap: () => print('TV Show'),
              ),
              GestureDetector(
                child: Text('Movies', style: Constant.textWithBold),
                onTap: () => print('Movies'),
              ),
              GestureDetector(
                child: Text('My List', style: Constant.textWithBold),
                onTap: () => print('My List'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
