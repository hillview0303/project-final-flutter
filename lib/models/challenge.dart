class Challenge {
  final String challengeName;
  final double distance; // 거리는 km 단위로 저장
  final String backgroundImg;
  final String badgeImg;
  final String location;
  final String content;
  final int coin;
  final DateTime? closingTime;
  final DateTime? createdAt;

  Challenge({
    required this.challengeName,
    required this.distance,
    required this.backgroundImg,
    required this.badgeImg,
    required this.location,
    required this.content,
    required this.coin,
    this.closingTime,
    this.createdAt,
  });
}

final List<Challenge> upcomingChallenges = [
  Challenge(
      challengeName: "에베레스트",
      distance: 5.0,
      backgroundImg: "assets/everest.png",
      badgeImg: "assets/everest.png",
      location: "네팔",
      content: "세계에서 가장 높은 산 에베레스트에 도전하세요.",
      coin: 2
  ),
  Challenge(
      challengeName: "칠쿠트 트레일",
      distance: 10.0,
      backgroundImg: "assets/chilkoot.png",
      badgeImg: "assets/chilkoot.png",
      location: "미국, 캐나다",
      content: "역사적인 칠쿠트 트레일을 따라 금광을 찾아서.",
      coin: 2
  ),
  Challenge(
      challengeName: "엘브루스",
      distance: 15.0,
      backgroundImg: "assets/elbrus.png",
      badgeImg: "assets/elbrus.png",
      location: "러시아",
      content: "유럽에서 가장 높은 산, 엘브루스를 정복하세요.",
      coin: 2
  ),
  Challenge(
      challengeName: "그랜드 캐니언",
      distance: 15.0,
      backgroundImg: "assets/grandcanyon.png",
      badgeImg: "assets/grandcanyon.png",
      location: "미국",
      content: "거대한 자연의 경이, 그랜드 캐니언을 걸어보세요.",
      coin: 2
  ),
  Challenge(
      challengeName: "산티아고 순례길",
      distance: 15.0,
      backgroundImg: "assets/santiago.png",
      badgeImg: "assets/santiago.png",
      location: "스페인",
      content: "고대 순례자의 길을 따라 산티아고로의 여정을 시작하세요.",
      coin: 2
  ),
  Challenge(
      challengeName: "디날리",
      distance: 15.0,
      backgroundImg: "assets/denali.png",
      badgeImg: "assets/denali.png",
      location: "미국",
      content: "북아메리카 최고봉, 디날리 산의 정상을 향해.",
      coin: 2
  ),
    Challenge(
        challengeName: "잉카 트레일",
        distance: 15.0,
        backgroundImg: "assets/denali.png",
        badgeImg: "assets/denali.png",
        location: "미국",
        content: "북아메리카 최고봉, 디날리 산의 정상을 향해.",
        coin: 2
    ),
    Challenge(
        challengeName: "K2",
        distance: 15.0,
        backgroundImg: "assets/denali.png",
        badgeImg: "assets/denali.png",
        location: "미국",
        content: "북아메리카 최고봉, 디날리 산의 정상을 향해.",
        coin: 2
    ),
    Challenge(
        challengeName: "킬리만자로",
        distance: 15.0,
        backgroundImg: "assets/denali.png",
        badgeImg: "assets/denali.png",
        location: "미국",
        content: "북아메리카 최고봉, 디날리 산의 정상을 향해.",
        coin: 2
    ),
    Challenge(
        challengeName: "웨스트 하일랜드 웨이",
        distance: 15.0,
        backgroundImg: "assets/denali.png",
        badgeImg: "assets/denali.png",
        location: "미국",
        content: "북아메리카 최고봉, 디날리 산의 정상을 향해.",
        coin: 2
    ),
    Challenge(
        challengeName: "빈슨",
        distance: 15.0,
        backgroundImg: "assets/denali.png",
        badgeImg: "assets/denali.png",
        location: "미국",
        content: "북아메리카 최고봉, 디날리 산의 정상을 향해.",
        coin: 2
    ),
    Challenge(
        challengeName: "라인슈타이크 트레일",
        distance: 15.0,
        backgroundImg: "assets/denali.png",
        badgeImg: "assets/denali.png",
        location: "미국",
        content: "북아메리카 최고봉, 디날리 산의 정상을 향해.",
        coin: 2
    ),
    Challenge(
        challengeName: "안나푸르나 서킷",
        distance: 15.0,
        backgroundImg: "assets/denali.png",
        badgeImg: "assets/denali.png",
        location: "미국",
        content: "북아메리카 최고봉, 디날리 산의 정상을 향해.",
        coin: 2
    ),
    Challenge(
        challengeName: "아콩가과",
        distance: 15.0,
        backgroundImg: "assets/denali.png",
        badgeImg: "assets/denali.png",
        location: "미국",
        content: "북아메리카 최고봉, 디날리 산의 정상을 향해.",
        coin: 2
    ),
  ];

  final List<Challenge> ongoingChallenges = [
    Challenge(
        challengeName: "그로스글로크너",
        distance: 3798.0,
        backgroundImg: "assets/grossglock.png",
        badgeImg: "assets/grossglock.png",
        location: "오스트리아",
        content: "오스트리아 최고봉 그로스글로크너의 장엄한 경관을 체험하세요.",
        coin: 2,
        createdAt: DateTime.now(),
        closingTime: DateTime.now().add(Duration(days: 30)) // 생성일로부터 30일 후 마감
    )
  ];

final List<Challenge> pastChallenges = [
  Challenge(
      challengeName: "만리장성",
      distance: 20.0,
      backgroundImg: "assets/manri.png",
      badgeImg: "assets/manri.png",
      location: "중국",
      content: "세계적인 문화 유산, 만리장성을 따라 걸으며 역사를 체험하세요.",
      coin: 2
  ),
  Challenge(
      challengeName: "크레이들산 오버랜드 트랙",
      distance: 15.0,
      backgroundImg: "assets/cradle.png",
      badgeImg: "assets/cradle.png",
      location: "호주",
      content: "호주의 야생을 느낄 수 있는 크레이들산 오버랜드 트랙을 탐험하세요.",
      coin: 2
  ),
  Challenge(
      challengeName: "애팔래치안 트레일",
      distance: 15.0,
      backgroundImg: "assets/appalachian.png",
      badgeImg: "assets/appalachian.png",
      location: "미국",
      content: "미국 동부의 광활한 자연을 경험할 수 있는 애팔래치안 트레일을 걸어보세요.",
      coin: 2
  ),
  Challenge(
      challengeName: "코지어스코",
      distance: 20.0,
      backgroundImg: "assets/appalachian.png",
      badgeImg: "assets/appalachian.png",
      location: "호주",
      content: "호주 최고봉 코지어스코 정상에 오르세요.",
      coin: 2
  ),
  Challenge(
      challengeName: "밀퍼드 트랙",
      distance: 15.0,
      backgroundImg: "assets/appalachian.png",
      badgeImg: "assets/appalachian.png",
      location: "뉴질랜드",
      content: "뉴질랜드의 숨막히는 경관을 자랑하는 밀퍼드 트랙을 걷습니다.",
      coin: 2
  ),
  Challenge(
      challengeName: "몽블랑",
      distance: 15.0,
      backgroundImg: "assets/appalachian.png",
      badgeImg: "assets/appalachian.png",
      location: "프랑스, 이탈리아",
      content: "유럽의 지붕, 몽블랑을 정복하는 도전을 완료하세요.",
      coin: 2
  ),
  Challenge(
      challengeName: "몽블랑 서큘러",
      distance: 20.0,
      backgroundImg: "assets/appalachian.png",
      badgeImg: "assets/appalachian.png",
      location: "프랑스, 이탈리아, 스위스",
      content: "세 나라를 아우르는 몽블랑 서큘러 트레일을 경험하세요.",
      coin: 2
  ),
  Challenge(
      challengeName: "아라라트",
      distance: 15.0,
      backgroundImg: "assets/appalachian.png",
      badgeImg: "assets/appalachian.png",
      location: "터키",
      content: "신화와 역사가 깃든 아라라트 산을 등반하세요.",
      coin: 2
  ),
  Challenge(
      challengeName: "킬리만자로 마차메 루트",
      distance: 15.0,
      backgroundImg: "assets/appalachian.png",
      badgeImg: "assets/appalachian.png",
      location: "탄자니아",
      content: "킬리만자로의 마차메 루트를 통해 아프리카 최고봉에 도전하세요.",
      coin: 2
  ),
  Challenge(
      challengeName: "올림푸스",
      distance: 20.0,
      backgroundImg: "assets/appalachian.png",
      badgeImg: "assets/appalachian.png",
      location: "그리스",
      content: "신들의 산, 올림푸스를 정복하세요.",
      coin: 2
  ),
  Challenge(
      challengeName: "투브칼 서킷",
      distance: 15.0,
      backgroundImg: "assets/appalachian.png",
      badgeImg: "assets/appalachian.png",
      location: "모로코",
      content: "아틀라스 산맥의 장엄한 투브칼 서킷을 경험하세요.",
      coin: 2
  ),
  Challenge(
      challengeName: "파타고니아 서킷",
      distance: 15.0,
      backgroundImg: "assets/appalachian.png",
      badgeImg: "assets/appalachian.png",
      location: "칠레, 아르헨티나",
      content: "남미의 야생 자연, 파타고니아 서킷을 탐험하세요.",
      coin: 2
  ),
];