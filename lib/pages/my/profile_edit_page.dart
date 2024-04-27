import 'package:flutter/material.dart';

import 'components/profile_image_edit.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ProfileImageEdit(),

        ],
      ),
    );
  }
}
