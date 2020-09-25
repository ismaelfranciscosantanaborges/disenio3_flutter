import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/constant.dart';

class VerticalIconButton extends StatelessWidget {
  const VerticalIconButton({
    @required this.title,
    @required this.icon,
    @required this.onTap,
  });

  final String title;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              title,
              style: Constant.text,
            )
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
