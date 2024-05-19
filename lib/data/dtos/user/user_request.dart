class JoinRequestDTO {
  final String username;
  final String phone;
  final String password;
  final String name;
  final String birth;
  final String gender;
  final double height;

  JoinRequestDTO(
      {required this.username,
      required this.phone,
      required this.password,
      required this.name,
      required this.birth,
      required this.gender,
      required this.height});

  Map<String, dynamic> toJson() => {
        "username": username,
        "phone": phone,
        "password": password,
        "name": name,
        "birth": birth,
        "gender": gender,
        "height": height
      };
}

class LoginRequestDTO {
  final String username;
  final String password;

  LoginRequestDTO(this.username, this.password);

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}

class UserUpdateDTO {
  final int id;
  final String name;
  final String password;
  final String phone;
  final double height;

  UserUpdateDTO({
    required this.id,
    required this.name,
    required this.password,
    required this.phone,
    required this.height,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "password": this.password,
      "phone": this.phone,
      "height": this.height,
    };
  }
}

class UserImgUpdateDTO {
  final String userImg;

  UserImgUpdateDTO(this.userImg);

  Map<String, dynamic> toJson() {
    return {
      "userImg": this.userImg,
    };
  }
}

class UsernameCheckDTO{
  final String username;

  UsernameCheckDTO(this.username);

  Map<String, dynamic> toJson() => {
    "username": username,
  };

}