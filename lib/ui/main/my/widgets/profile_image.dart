import 'dart:convert';

import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {

  final String userImage;

  ProfileImage(this.userImage);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: MemoryImage(base64Decode(userImage)),
          fit: BoxFit.cover,
        ),
        border: Border.all(color: Colors.white, width: 4),
      ),
    );
  }
}