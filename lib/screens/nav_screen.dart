import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_netflix_responsive_ui/cubit/app_bar_cubit.dart';
import 'package:flutter_netflix_responsive_ui/screens/screens.dart';
import 'package:flutter_netflix_responsive_ui/widgets/widget.dart';

class NavScreen extends StatefulWidget {
  NavScreen({Key key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  List<Widget> _screens = const [
    HomeScreen(
      key: PageStorageKey('home'),
    ),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  Map<String, IconData> _icons = const {
    'Home': Icons.home,
    'Search': Icons.search,
    'Coming Soon': Icons.queue_play_next,
    'Downloads': Icons.file_download,
    'More': Icons.menu
  };

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBarCubit>(
      create: (context) => AppBarCubit(),
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: !Responsive.isDesktop(context)
            ? BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.black,
                currentIndex: _currentIndex,
                items: _icons
                    .map(
                      (title, icon) => MapEntry(
                        title,
                        BottomNavigationBarItem(
                          icon: Icon(icon, size: 30),
                          title: Text(title),
                        ),
                      ),
                    )
                    .values
                    .toList(),
                selectedFontSize: 11,
                unselectedFontSize: 11,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey,
                onTap: (index) => setState(() => _currentIndex = index),
              )
            : null,
      ),
    );
  }
}
