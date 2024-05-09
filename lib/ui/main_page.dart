import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '_common/bottom_navigation_bar.dart';
import 'main/activity/activity_page.dart';
import 'main/challenge/challenge_page.dart';
import 'main/my/my_page.dart';
import 'main/today/today_page.dart';

class MainPage extends StatefulWidget {
  final int index;
  MainPage(this.index);

  @override
  State<MainPage> createState() => _MainPageState(index);
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  _MainPageState(this._selectedIndex);

  @override
  void initState() {
    super.initState();
    _requestActivityRecognitionPermission();
  }

  Future<void> _requestActivityRecognitionPermission() async {
    var status = await Permission.activityRecognition.status;
    if (!status.isGranted) {
      var result = await Permission.activityRecognition.request();
      _handlePermissionStatus(result);
    }
  }

  void _handlePermissionStatus(PermissionStatus status) {
    if (status.isGranted) {
      // 권한이 허용된 경우
      print("Permission granted");
    } else {
      if (status.isPermanentlyDenied) {
        // '다시 묻지 않기' 선택 후 거부
        _showSettingsDialog();
      } else {
        // 일반 거부
        _showPermissionDialog();
      }
    }
  }

  void _showSettingsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("권한 필요"),
        content: Text("이 앱은 활동 인식 권한이 필요합니다. 설정에서 권한을 허용해주세요."),
        actions: <Widget>[
          TextButton(
            child: Text("설정으로 이동"),
            onPressed: () {
              Navigator.of(context).pop();
              openAppSettings();
            },
          ),
          TextButton(
            child: Text("취소"),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("권한 필요"),
        content: Text("이 앱은 활동 인식 권한이 필요합니다. 권한을 허용해주세요."),
        actions: <Widget>[
          TextButton(
            child: Text("허용"),
            onPressed: () {
              Navigator.of(context).pop();
              _requestActivityRecognitionPermission(); // 권한 요청 다시 시도
            },
          ),
          TextButton(
            child: Text("취소"),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          TodayPage(),
          ActivityPage(),
          ChallengePage(),
          MyPage()
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
}
