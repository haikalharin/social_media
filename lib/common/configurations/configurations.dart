import 'default_env.dart';

class Configurations {
  static String _host = DefaultConfig.host;
  static String _subHost = DefaultConfig.subHost;
  static String _imageHost = DefaultConfig.imageHost;
  static String _key = DefaultConfig.imageHost;



  Future<void> setConfigurationValues(Map<String, dynamic> value) async {
    _host =  value['host'] ?? DefaultConfig.host;
    _subHost =  value['sub_host'] ?? DefaultConfig.host;
    _imageHost = value['image_host'] ?? DefaultConfig.imageHost;
    _key = value['key'] ?? DefaultConfig.key;
     }

  static String get host => _host;

  static String get subHost => _subHost;

  static String get imageHost => _imageHost;

  static String get key => _key;

}
