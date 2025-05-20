import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDemo {
  static const String _keyUserId = "_id";
  static const String _keyName = "name";
  static const String _keyEmail = "email";
  static const String _keyIsVerified = "isVerified";
  static const String _keyIsVerifiedOtp = "isVerifiedotp";
  static const String _keyCreatedAt = "createdAt";
  static const String _keyUpdatedAt = "updatedAt";
  static const String _keyToken = "token";
  static const String _avatar = "avatar";

  /// حفظ كل بيانات المستخدم مرة واحدة
  static Future<void> saveUserData({
    required String id,
    required String name,
    required String email,
    required String avatar,
    required bool isVerified,
    required bool isVerifiedOtp,
    required String createdAt,
    required String updatedAt,
    required String token,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUserId, id);
    await prefs.setString(_avatar, avatar);
    await prefs.setString(_keyName, name);
    await prefs.setString(_keyEmail, email);
    await prefs.setBool(_keyIsVerified, isVerified);
    await prefs.setBool(_keyIsVerifiedOtp, isVerifiedOtp);
    await prefs.setString(_keyCreatedAt, createdAt);
    await prefs.setString(_keyUpdatedAt, updatedAt);
    await prefs.setString(_keyToken, token);
  }

  /// استرجاع كل بيانات المستخدم كماب
  static Future<Map<String, dynamic>?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(_keyUserId)) return null;

    return {
      "_id": prefs.getString(_keyUserId),
      "name": prefs.getString(_keyName),
      "email": prefs.getString(_keyEmail),
      "isVerified": prefs.getBool(_keyIsVerified),
      "isVerifiedotp": prefs.getBool(_keyIsVerifiedOtp),
      "createdAt": prefs.getString(_keyCreatedAt),
      "updatedAt": prefs.getString(_keyUpdatedAt),
      "token": prefs.getString(_keyToken),
    };
  }

  /// حذف كل بيانات المستخدم
  static Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  // ==============================
  // ✅ استرجاع وتحديث كل متغير على حدة
  // ==============================

  /// 🔹 ID
  static Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUserId);
  }

  static Future<void> setUserId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUserId, id);
  }

  /// 🔹 Name
  static Future<String> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyName) ?? "Mohamed";
  }

  static Future<void> setUserName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyName, name);
  }

  /// 🔹 Email
  static Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyEmail);
  }

  static Future<void> setUserEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyEmail, email);
  }

  /// 🔹 isVerified
  static Future<bool?> getIsVerified() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsVerified);
  }

  static Future<void> setIsVerified(bool isVerified) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsVerified, isVerified);
  }

  /// 🔹 isVerifiedOtp
  static Future<bool?> getIsVerifiedOtp() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsVerifiedOtp);
  }

  static Future<void> setIsVerifiedOtp(bool isVerifiedOtp) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsVerifiedOtp, isVerifiedOtp);
  }

  /// 🔹 Created At
  static Future<String?> getCreatedAt() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyCreatedAt);
  }

  static Future<void> setCreatedAt(String createdAt) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyCreatedAt, createdAt);
  }

  /// 🔹 Updated At
  static Future<String?> getUpdatedAt() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUpdatedAt);
  }

  static Future<void> setUpdatedAt(String updatedAt) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUpdatedAt, updatedAt);
  }

  /// 🔹 Token
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyToken);
  }

  static Future<void> setavatar(String avatar) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_avatar, avatar);
  }

  /// 🔹 Token
  static Future<String?> getavatar() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_avatar);
  }

  static Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyToken, token);
  }

  static setFirstTime() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("FirstTime", false);
  }

  static Future<bool> getFirstTime() async {
    setFirstTime();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.getBool("FirstTime") ?? true;
  }
}
