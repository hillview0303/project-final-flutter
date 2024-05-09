class UserImgUpdateResponseDTO {
  final int id;
  final String userImg;

  UserImgUpdateResponseDTO({required this.userImg, required this.id});

  factory UserImgUpdateResponseDTO.fromJson(Map<String, dynamic> json) {
    return UserImgUpdateResponseDTO(
      id: json["id"],
      userImg: json["userImg"],
    );
  }
//

//
}
