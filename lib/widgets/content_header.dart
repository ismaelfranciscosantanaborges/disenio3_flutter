import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/constant.dart';
import 'package:flutter_netflix_responsive_ui/models/models.dart';
import 'package:flutter_netflix_responsive_ui/widgets/widget.dart';
import 'package:video_player/video_player.dart';

class ContentHeader extends StatelessWidget {
  const ContentHeader({@required this.featuredContent});

  final Content featuredContent;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 500.0,
        child: Responsive(
          movile: _ContentHeaderMovile(featuredContent: featuredContent),
          desktop: _ContentHeaderDesktop(featuredContent: featuredContent),
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

class _ContentHeaderMovile extends StatelessWidget {
  const _ContentHeaderMovile({Key key, @required this.featuredContent})
      : super(key: key);
  final Content featuredContent;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}

class _ContentHeaderDesktop extends StatefulWidget {
  const _ContentHeaderDesktop({Key key, @required this.featuredContent})
      : super(key: key);
  final Content featuredContent;

  @override
  __ContentHeaderDesktopState createState() => __ContentHeaderDesktopState();
}

class __ContentHeaderDesktopState extends State<_ContentHeaderDesktop> {
  VideoPlayerController _videoController;
  bool _isMuted;

  @override
  void initState() {
    super.initState();
    _isMuted = true;
    _videoController =
        VideoPlayerController.network(widget.featuredContent.videoUrl)
          ..initialize().then((value) => setState(() {}))
          ..setVolume(0)
          ..play();
  }

  @override
  void dispose() {
    super.dispose();
    _videoController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _videoController.value.isPlaying
          ? _videoController.pause()
          : _videoController.play(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          AspectRatio(
            aspectRatio: _videoController.value.initialized
                ? _videoController.value.aspectRatio
                : 2.344,
            child: _videoController.value.initialized
                ? VideoPlayer(_videoController)
                : Image.asset(
                    widget.featuredContent.imageUrl,
                    fit: BoxFit.cover,
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
            left: 60,
            right: 60,
            bottom: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 250,
                  child: Image.asset(widget.featuredContent.titleImageUrl),
                ),
                SizedBox(height: 15),
                Text(
                  widget.featuredContent.description,
                  style: Constant.textDescriptions,
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    FlatButton.icon(
                      onPressed: () => print('play video'),
                      icon: Icon(
                        Icons.play_arrow,
                        size: 30,
                      ),
                      label: Text('Play'),
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    FlatButton.icon(
                      onPressed: () => print('More Info'),
                      color: Colors.white,
                      icon: const Icon(
                        Icons.info_outline,
                        size: 30,
                      ),
                      label: const Text(
                        'More Info',
                        style: Constant.textWithBoldBlack,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    if (_videoController.value.initialized)
                      IconButton(
                        iconSize: 30,
                        color: Colors.white,
                        icon:
                            Icon(_isMuted ? Icons.volume_off : Icons.volume_up),
                        onPressed: () => setState(() {
                          _isMuted
                              ? _videoController.setVolume(100)
                              : _videoController.setVolume(0);

                          _isMuted = !_isMuted;
                        }),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
