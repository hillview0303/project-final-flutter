import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/pages/today/todat_page.dart';
import '../common/bottom_navigation_bar.dart';
import 'activity/activity_page.dart';
import 'challenge/challenge_page.dart';
import 'my/my_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildProfileAppBar(),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          TodayPage(),  // 오늘의 나
          ActivityPage(), // 나의 활동
          ChallengePage(), // 챌린지
          MyPage() // 마이페이지
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }AppBar _buildProfileAppBar() {
    return AppBar(

      actions: <Widget>[
        IconButton(
          icon: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.notifications_outlined,size: 30),

          ), // 종 모양 아이콘
          onPressed: () {
          },
        ),
      ],
    );
  }

}

