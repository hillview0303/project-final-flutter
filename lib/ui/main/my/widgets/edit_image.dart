import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:project_app/_core/constants/size.dart';

class EditImage extends StatefulWidget {
  final String userImage;

  EditImage(this.userImage);

  @override
  _EditImageState createState() => _EditImageState(userImage);
}

class _EditImageState extends State<EditImage> {

  final String userImage;
  _EditImageState(this.userImage);

  ImageProvider<Object>? _profileImage;
  List<String> avatars = [
    "assets/images/avatar1.png",
    "assets/images/avatar2.png",
    "assets/images/avatar3.png",
    "assets/images/avatar4.png",
    "assets/images/avatar5.png",
    "assets/images/avatar6.png",
    "assets/images/avatar7.png",
    "assets/images/avatar8.png",
  ];

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _profileImage = FileImage(File(pickedFile.path));
      });
    }
  }

  void _showAvatarChooser() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(gap_sm),
          child: Container(
            height: 350,
            child: Column(
              children: [
                ListTile(
                  title: Text('프로필 사진을 선택하세요'),
                  onTap: () => Navigator.of(context).pop(),
                ),
                Container(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: avatars.length,
                    itemBuilder: (context, index) => Container(
                      width: 100,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _profileImage = AssetImage(avatars[index]);
                          });
                          Navigator.of(context).pop();
                        },
                        child: Image.asset(avatars[index]),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('앨범에서 추가하기'),
                  onTap: () {
                    _pickImage(ImageSource.gallery);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text('카메라 열기'),
                  onTap: () {
                    _pickImage(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 75,
            backgroundColor: Colors.grey[300],
            backgroundImage: _profileImage ?? MemoryImage(base64Decode(userImage)),
          ),
          Positioned(
            top: 105,
            bottom: 0,
            right: 0,
            child: FloatingActionButton(
              onPressed: _showAvatarChooser,
              mini: true,
              backgroundColor: TColor.darkGrey,
              child: Icon(
                Icons.camera_alt,
                color: TColor.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
