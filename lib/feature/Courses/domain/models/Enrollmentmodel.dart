class EnrollmentResponse {
  final bool success;
  final String message;
  final dynamic data;

  EnrollmentResponse({
    required this.success,
    required this.message,
    this.data,
  });

  factory EnrollmentResponse.fromJson(Map<String, dynamic> json) {
    return EnrollmentResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'], // null or any type
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data,
    };
  }
}
