import 'package:flutter/material.dart';
import 'package:project_app/pages/my/components/edit_name_section.dart';
import 'package:project_app/pages/my/components/edit_password_section.dart';

import 'components/edit_button_section.dart';
import 'components/edit_height_section.dart';
import 'components/edit_image_section.dart';
import 'components/edit_phone_section.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildEditAppBar(),
      body: ListView(
        children: [
          EditImageSection(),
          EditNameSection(),
          EditPasswordSection(),
          EditPhoneSection(),
          EditHeighteSection(),
          const SizedBox(height: 25.0),
          EditButtonSection(),
        ],
      ),
    );
  }

  AppBar _buildEditAppBar() {
    return AppBar(
      leading: Icon(Icons.arrow_back_ios),
      title: Text("프로필 수정", style: TextStyle(fontSize: 20)),
      centerTitle: true,
    );
  }
}
