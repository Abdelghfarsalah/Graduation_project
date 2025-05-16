class Updateuserdata {
  final String id;
  final String name;
  final String email;
  final bool isVerified;
  final bool isVerifiedotp;
  final String avatar;
  final String createdAt;
  final String updatedAt;
  final int v;

  Updateuserdata({
    required this.id,
    required this.name,
    required this.email,
    required this.isVerified,
    required this.isVerifiedotp,
    required this.avatar,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Updateuserdata.fromJson(Map<String, dynamic> json) {
    return Updateuserdata(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      isVerified: json['isVerified'],
      isVerifiedotp: json['isVerifiedotp'],
      avatar: json['avatar'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
}
