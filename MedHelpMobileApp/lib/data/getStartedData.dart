class SliderData {
  String imagePath, title, description;

  SliderData({this.imagePath, this.title, this.description});

  void setImageAssetPath(String getImagePath) {
    imagePath = getImagePath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDescription(String getDescription) {
    description = getDescription;
  }

  String getImageAssetPath() {
    return imagePath;
  }

  String getTitle() {
    return title;
  }

  String getDescription() {
    return description;
  }
}

List<SliderData> getSlides() {
  List<SliderData> slides = new List<SliderData>();
  SliderData sliderData = new SliderData();

  sliderData.setImageAssetPath('assets/images/doctors.png');
  sliderData.setTitle('SIRIUS');
  sliderData.setDescription(
      'Sirius is an application which helps you in finding doctor easily around you with one "TAP"....');
  slides.add(sliderData);
  sliderData = new SliderData();

  sliderData.setImageAssetPath('assets/images/doctor.png');
  sliderData.setTitle('About doctor section');
  sliderData.setDescription(
      'Doctors can see their patients history and treated patients in this section...');
  slides.add(sliderData);
  sliderData = new SliderData();

  sliderData.setImageAssetPath('assets/images/patient.png');
  sliderData.setTitle('About Patient section');
  sliderData.setDescription(
      'Patients can easily find the available doctors around and can share his data with any doctor securely on one "Tap" ');
  slides.add(sliderData);
  sliderData = new SliderData();

  return slides;
}
