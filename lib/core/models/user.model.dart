import 'package:supabase_flutter/supabase_flutter.dart';

class UserModel {
  User? detail;
  final String name;
  final String avatar;
  UserModel({
    this.detail,
    required this.name,
    required this.avatar,
  });
  factory UserModel.fromMap(Map<String, dynamic>? map) {
    return UserModel(
      name: map?['name'] ?? '',
      avatar: map?['avatar_url'] ?? '',
    );
  }
}
