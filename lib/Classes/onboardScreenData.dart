class SliderModel {
  String _imagePath;
  String _title;
  String _description;

  SliderModel({String imagePath, String title, String description}) {
    this._imagePath = imagePath;
    this._title = title;
    this._description = title;
  }

  String get description => _description;

  setdescription(String value) {
    _description = value;
  }

  String get title => _title;

  settitle(String value) {
    _title = value;
  }

  String get imagePath => _imagePath;

  setimagePath(String value) {
    _imagePath = value;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();

  SliderModel sliderModel = new SliderModel();

  sliderModel.setimagePath("assets/landingScreenImages/s1.png");
  sliderModel.settitle("About Application");
  sliderModel.setdescription(
      "This app is a solution to the classic “I want to work out, but I feel like I just don’t have the time” conundrum. With 20-minute, no-equipment sweat sessions designed to deliver maximum benefit in the shortest time possible, you can quickly and effectively break a sweat—and then get on with the rest of your day.");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  sliderModel.setimagePath("assets/landingScreenImages/s2.png");
  sliderModel.settitle("Random Exercises");
  sliderModel.setdescription(
      "This application has a ability to select 5 random workout exercises for you with the best algorithm places behind");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  sliderModel.setimagePath("assets/landingScreenImages/s3.png");
  sliderModel.settitle("Lets Workout together");
  sliderModel.setdescription(
      "This app will not let you feel boured for a sigle point of time, with one of the best music selected just for you");
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  return slides;
}
