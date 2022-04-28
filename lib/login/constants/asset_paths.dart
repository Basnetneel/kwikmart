const String imageAssetsRoot = "assets/images/";
final String logo = _getImagePath("login.png");


String _getImagePath(String fileName){
  return imageAssetsRoot + fileName;
}