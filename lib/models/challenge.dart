class Challenge {
  final String challengeName;
  final double distance; // 거리는 km 단위로 저장
  // final String backgroundImg;
  // final String badgeImg;
  // final String location;
  // final String content;
  final int coin;
  final closingTime;
  final createdAt;

  Challenge({
    required this.challengeName,
    required this.distance,
    // required this.backgroundImg,
    // required this.badgeImg,
    // required this.location,
    // required this.content,
    required this.coin,
    this.closingTime,
    this.createdAt,
  });
}

List<Challenge> upcomingChallenges = [
    Challenge(
        challengeName: "에베레스트",
        distance: 5.0,
        coin: 2
    ),
    Challenge(
        challengeName: "칠쿠트 트레일",
        distance: 10.0,
        coin: 2
    ),
    Challenge(
        challengeName: "엘브루스",
        distance: 15.0,
        coin: 2
    ),
    Challenge(
        challengeName: "그랜드 캐니언",
        distance: 15.0,
        coin: 2
    ),
    Challenge(
        challengeName: "산티아고 순례길",
        distance: 15.0,
        coin: 2
    ),
    Challenge(
        challengeName: "디날리",
        distance: 15.0,
        coin: 2
    ),
    Challenge(
        challengeName: "잉카 트레일",
        distance: 15.0,
        coin: 2
    ),
    Challenge(
        challengeName: "K2",
        distance: 15.0,
        coin: 2
    ),
    Challenge(
        challengeName: "킬리만자로",
        distance: 15.0,
        coin: 2
    ),
    Challenge(
        challengeName: "웨스트 하일랜드 웨이",
        distance: 15.0,
        coin: 2
    ),
    Challenge(
        challengeName: "빈슨",
        distance: 15.0,
        coin: 2
    ),
    Challenge(
        challengeName: "라인슈타이크 트레일",
        distance: 15.0,
        coin: 2
    ),
    Challenge(
        challengeName: "안나푸르나 서킷",
        distance: 15.0,
        coin: 2
    ),
    Challenge(
        challengeName: "아콩가과",
        distance: 15.0,
        coin: 2
    ),
  ];

  final List<Challenge> ongoingChallenges = [
    Challenge(
        challengeName: "그로스글로크너",
        distance: 3798.0,
        createdAt: DateTime.now(),
        closingTime: DateTime.now().add(Duration(days: 30)), // 생성일로부터 30일 후
        coin: 2
    ),
  ];

  final List<Challenge> pastChallenges = [
    Challenge(
        challengeName: "만리장성",
        distance: 20.0,
        coin: 2
    ),
    Challenge(
        challengeName: "크레이들 산\n 오버랜드 트랙",
        distance: 15.0,
        coin: 2
    ),
    Challenge(
        challengeName: "애팔래치안 트레일",
        distance: 15.0,
        coin: 2
    ),
    Challenge(
        challengeName: "코지어스코",
        distance: 20.0,
        coin: 2
    ),
    Challenge(
        challengeName: "밀퍼드 트랙",
        distance: 15.0,
        coin: 2
    ),
    Challenge(
        challengeName: "몽블랑",
        distance: 15.0,
        coin: 2
    ),
    Challenge(
        challengeName: "몽블랑 서큘러",
        distance: 20.0,
        coin: 2
    ),
    Challenge(
        challengeName: "아라라트",
        distance: 15.0,
        coin: 2
    ),
    Challenge(
        challengeName: "킬리만자로 마차메 루트",
        distance: 15.0,
        coin: 2
    ),
    Challenge(
        challengeName: "올림푸스",
        distance: 20.0,
        coin: 2
    ),
    Challenge(
        challengeName: "투브칼 서킷",
        distance: 15.0,
        coin: 2
    ),
    Challenge(
        challengeName: "파타고니아 서킷",
        distance: 15.0,
        coin: 2
    ),
  ];
