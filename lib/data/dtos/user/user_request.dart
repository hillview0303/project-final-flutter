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

class UpdateBodyDataRequestDTO {
  final double fat;
  final double muscle;
  final double weight;

  UpdateBodyDataRequestDTO(this.fat, this.muscle, this.weight);

  Map<String, dynamic> toJson() =>
      {"fat": fat, "muscle": muscle, "weight": weight};
}
