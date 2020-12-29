//class designed to store the story urls and names
class Story {
  final String _imageURL;
  final String _name;

  Story(this._imageURL, this._name);

  //class implementation following abstraction concept

  String getImageUrl() {
    return _imageURL;
  }

  String getImageName() {
    return _name;
  }
}
