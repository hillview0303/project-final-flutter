import '../../models/challenges/challenge.dart';
import '../../models/user.dart';

class ChallengeSaveDTO {
  final User? user;
  final Challenge? challenge;

  ChallengeSaveDTO(this.user, this.challenge);

  Map<String, dynamic> toJson() {
    return {
      "user": this.user,
      "challenge": this.challenge,
    };
  }
}
