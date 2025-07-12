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
  static const String itemsSearchPage = "$itemsServer/search.php";

  //======================================== CartPage ==========================
  static const String cartServer = "$linkServer/cart";
  static const String addcart = "$cartServer/add.php";
  static const String deletecart = "$cartServer/delete.php";
  static const String countitemscart = "$cartServer/getcountitems.php";
  static const String viewcart = "$cartServer/view.php";
  //======================================== FavoritePage ==========================
  static const String favoriteServer = "$linkServer/favorite";
  static const String addfavorite = "$favoriteServer/add.php";
  static const String removefavorite = "$favoriteServer/remove.php";
  static const String viewfavorite = "$favoriteServer/view.php";
  static const String deletefavorite = "$favoriteServer/deletefavorite.php";
}
