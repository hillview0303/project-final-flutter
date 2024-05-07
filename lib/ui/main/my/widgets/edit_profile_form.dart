import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:project_app/data/dtos/user/user_response.dart';

import '../../../../data/dtos/my/my_response.dart';

class EditProfileForm extends StatefulWidget {
  final ProfileUpdateFormDTO reqDTO;


  EditProfileForm(this.reqDTO);

  @override
  _EditProfileFormState createState() => _EditProfileFormState(reqDTO);
}

class _EditProfileFormState extends State<EditProfileForm> {
  final ProfileUpdateFormDTO reqDTO;

  _EditProfileFormState(this.reqDTO) {
    _nameController.text = reqDTO.name ?? '';
    _phoneController.text = reqDTO.phone ?? '';
    _heightController.text = "${reqDTO.height}" ?? '';
  }

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _heightController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                label: Text('이름'),
                hintText: '이름을 입력하세요',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                label: Text('비밀번호'),
                hintText: '비밀번호를 입력하세요',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextFormField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                label: Text('비밀번호 확인'),
                hintText: '비밀번호를 다시 입력하세요',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                label: Text('휴대폰번호'),
                hintText: '휴대폰번호를 입력하세요',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextFormField(
              controller: _heightController,
              decoration: InputDecoration(
                label: Text('키'),
                hintText: '키를 입력하세요',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: SizedBox(
              width: double.infinity,  // Set the button width to full width of the container
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle the form submission
                  }
                },
                child: Text('저장'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kAccentColor2,
                  foregroundColor: TColor.white,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}