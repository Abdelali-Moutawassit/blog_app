class EndPoints {
  static const String baserUrl = "https://fakestoreapi.com/";
  static const String baserUrl2 = "https://dummyjson.com/";
  static const String baserUrl3 = "https://api.github.com/";

  
  static String get products{
    return "${baserUrl}products";
  }
 
  static String get users{
    return "${baserUrl}users";
  }

  static String get login{
    return "${baserUrl}auth/login";
  }

  static String get posts{
    return "${baserUrl2}posts";
  }

  static String get profile{
    return "${baserUrl}users/1";
  }

  static String get stories{
    return "${baserUrl3}users";
  }


}
