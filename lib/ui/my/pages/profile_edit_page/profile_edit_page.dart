import 'package:flutter/material.dart';
import 'package:project_app/ui/my/pages/profile_edit_page/widgets/edit_name.dart';
import 'package:project_app/ui/my/pages/profile_edit_page/widgets/edit_password.dart';

import 'widgets/edit_button.dart';
import 'widgets/edit_height.dart';
import 'widgets/edit_image.dart';
import 'widgets/edit_phone.dart';

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
          EditImage(),
          EditName(),
          EditPassword(),
          EditPhone(),
          EditHeighte(),
          const SizedBox(height: 25.0),
          EditButton(),
        ],
      ),
    );
  }
}
