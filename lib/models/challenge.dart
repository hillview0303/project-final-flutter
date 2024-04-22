class Challenge {
  final String name;
  final double distance; // 거리는 km 단위로 저장

  Challenge({
    required this.name,
    required this.distance,
  });
}

List<Challenge> upcomingChallenges = [
    Challenge(
        name: "에베레스트",
        distance: 5.0,
    ),
    Challenge(
        name: "만리장성",
        distance: 10.0
    ),
    Challenge(
        name: "산티아고 순례길",
        distance: 15.0
    ),
  ];

  final List<Challenge> ongoingChallenges = [
    Challenge(
        name: "에베레스트",
        distance: 100.0
    ),
    Challenge(
        name: "산티아고 순례길",
        distance: 100.0
    ),
    Challenge(
        name: "만리장성",
        distance: 200.0
    ),
  ];

  final List<Challenge> pastChallenges = [
    Challenge(
        name: "만리장성",
        distance: 20.0
    ),
    Challenge(
        name: "산티아고 순례길",
        distance: 20.0
    ),
    Challenge(
        name: "에베레스트",
        distance: 20.0
    ),
    Challenge(
        name: "에베레스트 베이스캠프",
        distance: 20.0
    ),
  ];
