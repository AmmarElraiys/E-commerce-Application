class Linkapi {
  static const String linkServer = "http://10.0.2.2/ecommerce";
  //=============================================== Image ================================
  static const String linkServerImage = "http://10.0.2.2/ecommerce/upload";
  static const String imagesCategories = "$linkServerImage/categories";
  static const String imagesItems = "$linkServerImage/items";

  //=============================================== Test ==========================

  static const String test = "$linkServer/test.php";

  //======================================== auth ==========================
  static const String signup = "$linkServer/auth/signup.php";
  static const String login = "$linkServer/auth/login.php";

  //======================================== forgetpassword ==========================

  static const String checkEmail = "$linkServer/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$linkServer/forgetpassword/resetpassword.php";

  //======================================== HomePage ==========================
  static const String homepage = "$linkServer/home.php";

  //======================================== ItemsPage ==========================
  static const String itemsServer = "$linkServer/items";
  static const String itemspage = "$itemsServer/items.php";
}
