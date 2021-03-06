import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instaclone/pages/my_feed_page.dart';
import 'package:flutter_instaclone/pages/my_profile_page.dart';
import 'package:flutter_instaclone/pages/my_search_page.dart';
import 'package:flutter_instaclone/pages/my_upload_page.dart';

import 'my_likes_page.dart';

class HomePage extends StatefulWidget {
  static final String id = 'home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = new PageController();
  int _currentTap = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // sub pagelarni o'z ichiga olish un PageView Ishlatiladi
      body: PageView(
        controller: _pageController,
        children: const [
          MyFeedPage(),
          MySearchPage(),
          MyUploadPage(),
          MyLikesPage(),
          MyProfilePage(),
        ],
        onPageChanged: (int index) {
          setState(() {
            _currentTap = index;
          });
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        onTap: (int index) {
          setState(() {
            _currentTap = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 200), curve: Curves.easeIn);
          });
        },
        currentIndex: _currentTap,
        activeColor: Color.fromRGBO(193, 53, 132, 1),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
