import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/constant.dart';
import 'package:flutter_netflix_responsive_ui/models/models.dart';

class ContentList extends StatelessWidget {
  const ContentList({
    @required this.title,
    @required this.contentList,
    this.isOriginals = false,
  });
  final String title;
  final List<Content> contentList;
  final isOriginals;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              title,
              style: Constant.textWithBoldH2,
            ),
          ),
          Container(
            height: isOriginals ? 500 : 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              itemCount: contentList.length,
              itemBuilder: (context, index) {
                final content = contentList[index];

                return GestureDetector(
                  onTap: () => print(content.name),
                  child: Container(
                    width: isOriginals ? 200 : 130,
                    height: isOriginals ? 400 : 200,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(content.imageUrl),
                          fit: BoxFit.cover),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
