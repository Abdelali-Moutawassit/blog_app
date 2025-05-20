class EndPoints {
  static const String baserUrl = "https://fakestoreapi.com/";
  static const String baserUrl2 = "https://dummyjson.com/";

  
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


}
