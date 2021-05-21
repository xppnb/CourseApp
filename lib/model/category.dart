class Category {
  final String name;
  final int numOfCourse;
  final String image;

  Category({this.name, this.numOfCourse, this.image});
}

List<Category> categorys = categoriesData
    .map((e) =>
        Category(name: e["name"], numOfCourse: e["course"], image: e["image"]))
    .toList();

List categoriesData = [
  {"name": "Marketing", "course": 17, "image": "images/marketing.png"},
  {"name": "UX Design", "course": 25, "image": "images/ux_design.png"},
  {"name": "Photography", "course": 13, "image": "images/photography.png"},
  {"name": "Business", "course": 17, "image": "images/business.png"},
];
