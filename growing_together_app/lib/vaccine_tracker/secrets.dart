import 'dart:io' show Platform;

class Secret {
  static const ANDROID_CLIENT_ID = "361910762916-0hpoea1n541h5olojlo6kubkt7lcibkv.apps.googleusercontent.com";
  static const WEB_CLIENT_ID = "<enter your iOS client secret>";
  static String getId() => Platform.isAndroid ? Secret.ANDROID_CLIENT_ID : Secret.WEB_CLIENT_ID;
}