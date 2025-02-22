class Authapi {
  static String baseurl = "https://smart-path-xi.vercel.app/api/v1";

  static String login = "$baseurl/auth/login";
  static String resendotp = "$baseurl/auth/resend-otp";
  static String verifyemail = "$baseurl/auth/verify-email";
  static String forgotpassword = "$baseurl/auth/forgot-password";
  static String verifypasswordOTP = "$baseurl/auth/verify-password-OTP";
  static String register = "$baseurl/auth/register";
  static String resetpassword = "$baseurl/user/reset-password";
  static String google = "$baseurl/auth/google";
}
