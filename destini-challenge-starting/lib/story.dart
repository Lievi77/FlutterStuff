//TODO: Step 2 - Create a new class called Story. [DONE]

//TODO: Step 3 - Create 3 properties for this class, A. storyTitle to store the story text. B. choice1 to store the text for choice 1, C. choice2 to store the text for choice 2. [DONE]

//TODO: Step 4 - Create a Constructor for this class to be able to initialise the properties created in step 3. [DONE]

class Story {
  String _storyTitle;
  String _choice1;
  String _choice2;

  Story({String storyTitle, String choice1, String choice2}) {
    _storyTitle = storyTitle;
    _choice1 = choice1;
    _choice2 = choice2;
  }

  String getTitle() {
    return _storyTitle;
  }

  String getChoice1() {
    return _choice1;
  }

  String getChoice2() {
    return _choice2;
  }
}
