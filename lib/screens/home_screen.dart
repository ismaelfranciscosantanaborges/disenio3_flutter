import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_netflix_responsive_ui/cubit/app_bar_cubit.dart';
import 'package:flutter_netflix_responsive_ui/data/data.dart';
import 'package:flutter_netflix_responsive_ui/widgets/widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        context.bloc<AppBarCubit>().setOffset(_scrollController.offset);
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Size _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: BlocBuilder<AppBarCubit, double>(
          builder: (context, state) {
            return CustomAppBar(
              scrollOffset: context.bloc<AppBarCubit>().state,
            );
          },
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          ContentHeader(
            featuredContent: sintelContent,
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 20),
            sliver: SliverToBoxAdapter(
              child: Previews(
                  key: PageStorageKey('previews'),
                  title: 'Previews',
                  contentList: previews),
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('myList'),
              title: 'My List',
              contentList: myList,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('netflixOriginals'),
              title: 'Netflix Orifinals',
              contentList: originals,
              isOriginals: true,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('trending'),
              title: 'Trending',
              contentList: trending,
            ),
          ),
          SliverPadding(padding: EdgeInsets.only(top: 20))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[850],
        child: Icon(Icons.cast),
        onPressed: () {},
      ),
    );
  }
}
