import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String? userImage;

  ProfileImage({this.userImage});

  @override
  Widget build(BuildContext context) {
    if (userImage == null) {
      return Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: const AssetImage("assets/images/defaultProfile.png"),
            fit: BoxFit.cover,
          ),
          border: Border.all(color: Colors.white, width: 4),
        ),
      );
    } else {
      return Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: CachedNetworkImageProvider(userImage!),
            // MemoryImage(base64Decode(userImage!))
            fit: BoxFit.cover,
          ),
          border: Border.all(color: Colors.white, width: 4),
        ),
      );
    }
  }
}
