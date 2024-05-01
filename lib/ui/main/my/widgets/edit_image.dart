import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditImage extends StatefulWidget {
  @override
  _EditImageState createState() => _EditImageState();
}

class _EditImageState extends State<EditImage> {
  File? _profileImage;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
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
            backgroundImage: _profileImage != null
                ? FileImage(_profileImage!)
                : AssetImage("assets/images/saram1.png") as ImageProvider<Object>?,
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: FloatingActionButton(
              onPressed: _pickImage,
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
