import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_app/_core/constants/size.dart';
import 'package:project_app/data/dtos/user/user_request.dart';
import 'package:project_app/ui/main/my/viewmodel/profile_edit_view_model.dart';

import '../../../../_core/utils/image_parse_util.dart';

class EditImage extends ConsumerWidget {
  final String userImage;

  EditImage(this.userImage);

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

  Future<String> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      _profileImage = FileImage(File(pickedFile.path));
    }

    return encodeXFileToBase64(pickedFile!);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProfileEditViewModel profileEditViewModel =
        ref.read(profileEditProvider.notifier);

    return Align(
      alignment: Alignment.center,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 75,
            backgroundColor: Colors.grey[300],
            backgroundImage:
                _profileImage ?? MemoryImage(base64Decode(userImage)),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: FloatingActionButton(
              onPressed: () {
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
                                      _profileImage =
                                          AssetImage(avatars[index]);
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
                              onTap: () async {
                                String img =
                                    await _pickImage(ImageSource.gallery);
                                profileEditViewModel
                                    .updateUserImg(UserImgUpdateDTO(img));
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.camera_alt),
                              title: Text('카메라 열기'),
                              onTap: () async {
                                String img =
                                    await _pickImage(ImageSource.camera);
                                profileEditViewModel
                                    .updateUserImg(UserImgUpdateDTO(img));
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              mini: true,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.edit,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
