enum ChallengeStatus { pending, inProgress, completed }

class Challenge {
  final int? id;

  Challenge({
    this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
    };
  }
}
