import 'default_env.dart';

class Configurations {
  static String _host = DefaultConfig.host;
  static String _sub_host = DefaultConfig.subHost;
  static String _imageHost = DefaultConfig.imageHost;
  static String _key = DefaultConfig.imageHost;



  Future<void> setConfigurationValues(Map<String, dynamic> value) async {
    _host =  value['host'] ?? DefaultConfig.host;
    _sub_host =  value['sub_host'] ?? DefaultConfig.host;
    _imageHost = value['image_host'] ?? DefaultConfig.imageHost;
    _key = value['key'] ?? DefaultConfig.key;
     }

  static String get host => _host;

  static String get sub_host => _sub_host;

  static String get imageHost => _imageHost;

  static String get key => _key;

}
