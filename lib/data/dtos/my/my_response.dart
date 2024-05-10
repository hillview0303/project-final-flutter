import '../challenge/challenge_response.dart';

class MyPageDTO {
  final int id;
  final String name;
  final double fat;
  final double muscle;
  final double weight;
  final List<ChallengeListDTO>? conqueredChallenge;
  final String? userImg;

  MyPageDTO(
      {required this.id,
      required this.name,
      required this.fat,
      required this.muscle,
      required this.weight,
      this.conqueredChallenge,
      required this.userImg});

  MyPageDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        fat = json["fat"].toDouble(),
        muscle = json["muscle"].toDouble(),
        weight = json["weight"].toDouble(),
        conqueredChallenge = json["conqueredChallenge"] != null
            ? (json["conqueredChallenge"] as List)
                .map((e) => ChallengeListDTO.fromJson(e))
                .toList()
            : null,
        userImg = json["userImg"] ?? null;
}

class ProfileUpdateFormDTO {
  final int id;
  final String name;
  final String phone;
  final double height;
  final String? userImg;

  ProfileUpdateFormDTO(
      {required this.id,
      required this.name,
      required this.phone,
      required this.height,
      this.userImg});

  ProfileUpdateFormDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        phone = json["phone"],
        height = json["height"],
        userImg = json["userImg"] ?? "";
}
