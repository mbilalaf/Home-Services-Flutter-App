class ServicesPageModel {
  final String img;
  final String title;

  ServicesPageModel({
    required this.img,
    required this.title,
  });

  factory ServicesPageModel.fromMap(Map<String, dynamic> map) {
    return ServicesPageModel(
      img: map['img'],
      title: map['title'],
    );
  }
}
