class AppImages{
  static var logo = getName("logo.png");
  static var terms = getName("terms.png");
  static var person = getName("person.png");
  static var wallpaper = getName("wallpaper.jpg");
  static var wallpaper2 = getName("wallpaper2.jpg");

  static String getName(String str){
    return "assets/images/$str";
  }
}

class AppIcons{
  static String getName(String str){
    return "assets/icons/$str";
  }
}