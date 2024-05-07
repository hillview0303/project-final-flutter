

class ChallengeResponseDTO {
  final int? id;
  final String? challengeName; // 챌린지명
  final String? subtitle;
  final DateTime? closingTime;
  final int? coin;
  final String? backImg;
  final List<dynamic>? upcomingChallenges;
  final List<dynamic>? pastchallenges;

  ChallengeResponseDTO(
      {this.id,
      this.challengeName,
      this.subtitle,
      this.closingTime,
      this.coin,
      this.backImg,
      this.upcomingChallenges,
      this.pastchallenges});

  factory ChallengeResponseDTO.fromJson(Map<String, dynamic> json) {
    return ChallengeResponseDTO(
      id: json["id"],
      challengeName: json["challengeName"],
      subtitle: json["subtitle"],
      closingTime: json["closingTime"] != null
          ? DateTime.parse(json["closingTime"])
          : null,
      coin: json["coin"],
      backImg: json["backImg"],
      upcomingChallenges: json["upcomingChallenges"],
      pastchallenges: json["pastChallenges"],
    );
  }
}

class AttendChallenge {
  int? id;
  String? challengeName; // 챌린지명
  String? subtitle;
  DateTime? closingTime;
  int? coin;
  String? backImg;

  AttendChallenge(
      {this.id,
      this.challengeName,
      this.subtitle,
      this.closingTime,
      this.coin,
      this.backImg});
}

class ChallengeListDTO {
  int id;
  String challengeName; // 챌린지명
  String distance; // 거리
  String badgeImg;
  bool? status;

  ChallengeListDTO(
      {required this.id,
      required this.challengeName,
      required this.distance,
      required this.badgeImg,
      this.status});

  factory ChallengeListDTO.fromJson(Map<String, dynamic> json) {
    return ChallengeListDTO(
      id: json["id"],
      challengeName: json["challengeName"],
      distance: json["distance"],
      badgeImg: json["badgeImg"],
      status: json["status"],
    );
  }
}

class ChallengeDetailDTO {
  int id;
  String challengeName; // 챌린지명
  String subTitle; // 부 제목
  int walking; // 걸어야할 걸음수
  String content; // 챌린지 내용
  bool? state;
  String backgroundImg;

  ChallengeDetailDTO(
      {required this.id,
      required this.challengeName,
      required this.subTitle,
      required this.walking,
      required this.content,
      this.state,
      required this.backgroundImg});

  factory ChallengeDetailDTO.fromJson(Map<String, dynamic> json) {
    return ChallengeDetailDTO(
      id: json["id"],
      challengeName: json["challengeName"],
      subTitle: json["subTitle"],
      walking: json["walking"],
      content: json["content"],
      state: json["state"] ?? null,
      backgroundImg: json["backgroundImg"],
    );
  }
// 챌린지 내용
}
