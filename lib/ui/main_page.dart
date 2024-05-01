import 'package:flutter/material.dart';
import 'package:project_app/ui/today/pages/today_page/today_page.dart';

import '_common/bottom_navigation_bar.dart';
import 'activity/pages/activity_page/activity_page.dart';
import 'challenge/pages/challenge_page/challenge_page.dart';
import 'my/pages/my_page/my_page.dart';

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
      // appBar: _buildProfileAppBar(),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          TodayPage(), // 오늘의 나
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
  }
// AppBar _buildProfileAppBar() {
//   return AppBar(
//
//     actions: <Widget>[
//       IconButton(
//         icon: Padding(
//           padding: const EdgeInsets.only(right: 20),
//           child: Icon(Icons.notifications_outlined,size: 30),
//
//         ), // 종 모양 아이콘
//         onPressed: () {
//         },
//       ),
//     ],
//   );
// }
}
