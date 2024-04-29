class JoinRequestDTO {
  final int id;
  final String username;
  final String phone;
  final String password;
  final String name;
  final DateTime birth;
  final String gender;
  final double height;

  JoinRequestDTO(
      {required this.id,
      required this.username,
      required this.phone,
      required this.password,
      required this.name,
      required this.birth,
      required this.gender,
      required this.height});

  Map<String, dynamic> toJson() => {
        "id": id,
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
