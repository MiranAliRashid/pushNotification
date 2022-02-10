import 'dart:convert';

class UserModel {
  String uid;
  String name;
  String token;
  UserModel({
    required this.uid,
    required this.name,
    required this.token,
  });

  UserModel copyWith({
    String? uid,
    String? name,
    String? token,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(uid: $uid, name: $name, token: $token)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.uid == uid &&
        other.name == name &&
        other.token == token;
  }

  @override
  int get hashCode => uid.hashCode ^ name.hashCode ^ token.hashCode;
}
