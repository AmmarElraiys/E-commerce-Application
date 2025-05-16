class Linkapi {
  static const String linkServer = "http://10.0.2.2/ecommerce";
  //=============================================== Test

  static const String test = "$linkServer/test.php";

  //======================================== auth
  static const String signup = "$linkServer/auth/signup.php";
  static const String login = "$linkServer/auth/login.php";

  //======================================== forgetpassword

  static const String checkEmail = "$linkServer/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$linkServer/forgetpassword/resetpassword.php";
}
