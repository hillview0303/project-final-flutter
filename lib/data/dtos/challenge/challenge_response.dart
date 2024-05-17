class ChallengeResponseDTO {
  final int? id;
  final String? challengeName; // 챌린지명
  final String? subtitle;
  final DateTime? closingTime;
  final int? coin;
  final int? walking;
  final int? totalWalking;
  final String? backImg;
  final List<ChallengeListDTO>? upcomingChallenges;
  final List<ChallengeListDTO>? pastchallenges;

  ChallengeResponseDTO(
      {this.id,
      this.challengeName,
      this.subtitle,
      this.closingTime,
      this.coin,
      this.backImg,
      this.walking,
      this.totalWalking,
      this.upcomingChallenges,
      this.pastchallenges});

  factory ChallengeResponseDTO.fromJson(Map<String, dynamic> json) {
    List<dynamic> prevUpcomingChallengeList = json["upcomingChallenges"];
    List<dynamic> prevPastChallenge = json["pastChallenges"];

    List<ChallengeListDTO> newUpcomingChallengeList = prevUpcomingChallengeList
        .map((e) => ChallengeListDTO.fromJson(e))
        .toList();
    List<ChallengeListDTO> newPastChallengeList =
        prevPastChallenge.map((e) => ChallengeListDTO.fromJson(e)).toList();

    return ChallengeResponseDTO(
      id: json["id"],
      challengeName: json["challengeName"],
      subtitle: json["subtitle"],
      closingTime: json["closingTime"] != null
          ? DateTime.parse(json["closingTime"])
          : null,
      coin: json["coin"],
      backImg: json["backImg"],
      totalWalking: json["totalWalking"],
      walking: json["walking"],
      upcomingChallenges: newUpcomingChallengeList,
      pastchallenges: newPastChallengeList,
    );
  }
}

class AttendChallenge {
  int? id;
  String? challengeName; // 챌린지명
  String? subtitle;
  DateTime? closingTime;
  int? coin;
  int? totalWalking;
  int? walking;
  String? backImg;

  AttendChallenge(
      {this.id,
      this.challengeName,
      this.subtitle,
      this.closingTime,
      this.totalWalking,
      this.walking,
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
  String subtitle; // 부 제목
  int walking; // 걸어야할 걸음수
  String content; // 챌린지 내용
  int coin;
  bool? state;
  String backgroundImg;

  ChallengeDetailDTO(
      {required this.id,
      required this.challengeName,
      required this.subtitle,
      required this.walking,
      required this.content,
      this.state,
      required this.coin,
      required this.backgroundImg});

  factory ChallengeDetailDTO.fromJson(Map<String, dynamic> json) {
    return ChallengeDetailDTO(
      id: json["id"],
      challengeName: json["challengeName"],
      subtitle: json["subTitle"],
      walking: json["walking"],
      content: json["content"],
      coin: json["coin"],
      state: json["state"] ?? null,
      backgroundImg: json["backgroundImg"],
    );
  }
// 챌린지 내용
}

class ChallengeStartDTO {
  final int userId;
  final int challengeId;
  final DateTime openingTime;
  final DateTime closingTime;
  final bool? status;

  ChallengeStartDTO(
      {required this.userId,
      required this.challengeId,
      required this.openingTime,
      required this.closingTime,
      this.status});

  factory ChallengeStartDTO.fromJson(Map<String, dynamic> json) {
    return ChallengeStartDTO(
      userId: json["userId"],
      challengeId: json["challengeId"],
      openingTime: DateTime.parse(json["openingTime"]),
      closingTime: DateTime.parse(json["closingTime"]),
      status: json["status"],
    );
  }
//
}
