
int getIdOrPage(String text){
  String result = text.replaceAll(new RegExp(r'[^0-9]'),'');
  int  resultInt = int.parse(result);

  return resultInt;
}