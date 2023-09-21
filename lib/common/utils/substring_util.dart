
String getIdOrPage(String text){
  String result = text.substring(text.length - 2);
  String resultFix = result.replaceAll("/", "");
  return resultFix;
}