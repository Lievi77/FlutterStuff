//TODO: Step 2 - Create a new class called Story. [DONE]

//TODO: Step 3 - Create 3 properties for this class, A. storyTitle to store the story text. B. choice1 to store the text for choice 1, C. choice2 to store the text for choice 2. [DONE]

//TODO: Step 4 - Create a Constructor for this class to be able to initialise the properties created in step 3. [DONE]

class Story {
  String _storyTitle;
  String _choice1;
  String _choice2;

  Story({String title, String choice1Text, String choice2Text}) {
    _storyTitle = title;
    _choice1 = choice1Text;
    _choice2 = choice2Text;
  }
}
