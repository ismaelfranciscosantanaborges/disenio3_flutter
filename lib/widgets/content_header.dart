import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/models/models.dart';
import 'package:flutter_netflix_responsive_ui/widgets/widget.dart';

class ContentHeader extends StatelessWidget {
  const ContentHeader({@required this.featuredContent});

  final Content featuredContent;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 500.0,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(featuredContent.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              bottom: 110,
              child: Container(
                width: 250,
                child: Image.asset(featuredContent.titleImageUrl),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  VerticalIconButton(
                    icon: Icons.add,
                    title: 'My List',
                    onTap: () => print('My List'),
                  ),
                  _PlayButton(),
                  VerticalIconButton(
                    icon: Icons.info_outline,
                    title: 'Info',
                    onTap: () => print('Info'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 20, 5),
      child: FlatButton.icon(
        onPressed: () => print('play video'),
        icon: Icon(
          Icons.play_arrow,
          size: 30,
        ),
        label: Text('Play'),
        color: Colors.white,
      ),
    );
  }
}
