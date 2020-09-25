import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/constant.dart';
import 'package:flutter_netflix_responsive_ui/models/models.dart';

class Previews extends StatelessWidget {
  const Previews({
    Key key,
    @required this.contentList,
    @required this.title,
  }) : super(key: key);
  final String title;
  final List<Content> contentList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Text(
            title,
            style: Constant.textWithBoldH2,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 165,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            itemCount: contentList.length,
            itemBuilder: (context, index) {
              final content = contentList[index];

              return GestureDetector(
                onTap: () => print(content.name),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(content.imageUrl),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Colors.black12,
                              Colors.black54,
                              Colors.black87
                            ],
                            stops: [0.5, 0.75, 1],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          border: Border.all(color: content.color, width: 3),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Image.asset(content.titleImageUrl),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
