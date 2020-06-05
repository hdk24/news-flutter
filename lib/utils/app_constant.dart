class AppConstant {

  static final String prefTheme = "pref_theme";

 static final String errorImage = "https://fomantic-ui.com/images/image-16by9.png";

 static final String dummyLongText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

 static List<String> categoryList() {
  List<String> category = [];
  category.add("General");
  category.add("Business");
  category.add("Entertainment");
  category.add("Health");
  category.add("Science");
  category.add("Sports");
  category.add("Technology");
  return category;
 }
}