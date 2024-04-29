import 'package:flutter/material.dart';
import 'package:project_app/ui/my/pages/profile_edit_page/widgets/edit_name_section.dart';
import 'package:project_app/ui/my/pages/profile_edit_page/widgets/edit_password_section.dart';

import 'widgets/edit_button_section.dart';
import 'widgets/edit_height_section.dart';
import 'widgets/edit_image_section.dart';
import 'widgets/edit_phone_section.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("프로필 수정"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
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
}
