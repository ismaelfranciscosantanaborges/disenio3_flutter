import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/assets.dart';
import 'package:flutter_netflix_responsive_ui/constant.dart';
import 'package:flutter_netflix_responsive_ui/widgets/widget.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key key, this.scrollOffset = 0.0}) : super(key: key);
  final double scrollOffset;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      color:
          Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: Responsive(
        movile: _CustomAppBarMovile(),
        desktop: _CustomAppBarDesktop(),
      ),
    );
  }
}

class _CustomAppBarMovile extends StatelessWidget {
  const _CustomAppBarMovile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo0),
          SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Text('TV Show', style: Constant.textWithBoldWhite),
                  onTap: () => print('TV Show'),
                ),
                GestureDetector(
                  child: Text('Movies', style: Constant.textWithBoldWhite),
                  onTap: () => print('Movies'),
                ),
                GestureDetector(
                  child: Text('My List', style: Constant.textWithBoldWhite),
                  onTap: () => print('My List'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {
  const _CustomAppBarDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Row(
      children: [
        Image.asset(Assets.netflixLogo1),
        SizedBox(
          width: 12.0,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Text('Home', style: Constant.textWithBoldWhite),
                onTap: () => print('Home'),
              ),
              GestureDetector(
                child: Text('TV Show', style: Constant.textWithBoldWhite),
                onTap: () => print('TV Show'),
              ),
              GestureDetector(
                child: Text('Movies', style: Constant.textWithBoldWhite),
                onTap: () => print('Movies'),
              ),
              GestureDetector(
                child: Text('Latest', style: Constant.textWithBoldWhite),
                onTap: () => print('Latest'),
              ),
              GestureDetector(
                child: Text('My List', style: Constant.textWithBoldWhite),
                onTap: () => print('My List'),
              ),
            ],
          ),
        ),
        const Spacer(),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(Icons.search),
                iconSize: 28,
                color: Colors.white,
                onPressed: () => print('search'),
              ),
              GestureDetector(
                child: Text('Home', style: Constant.textWithBoldWhite),
                onTap: () => print('Home'),
              ),
              GestureDetector(
                child: Text('KIDS', style: Constant.textWithBoldWhite),
                onTap: () => print('KIDS'),
              ),
              GestureDetector(
                child: Text('DVD', style: Constant.textWithBoldWhite),
                onTap: () => print('DVD'),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(Icons.card_giftcard),
                iconSize: 28,
                color: Colors.white,
                onPressed: () => print('gift'),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(Icons.notifications),
                iconSize: 28,
                color: Colors.white,
                onPressed: () => print('notifications'),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
