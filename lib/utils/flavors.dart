enum Flavor {
  DEVELOPMENT,
  PRODUCTION,
  STAGING
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.DEVELOPMENT:
        return 'dev';
      case Flavor.PRODUCTION:
        return 'prod';
      case Flavor.STAGING:
        return 'staging';
      default:
        return 'title';
    }
  }

}
