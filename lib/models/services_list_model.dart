class ServicesListModel {
  final String img;
  final String name;
  final String service_type;
  final String description;
  final String price;
  final String service;
  final String docID;
  final String comments;
  final String reviews;
  final String shares;

  final List<String> gallery;

  ServicesListModel({
    required this.img,
    required this.name,
    required this.service_type,
    required this.description,
    required this.price,
    required this.service,
    required this.docID,
    required this.comments,
    required this.reviews,
    required this.shares,
    required this.gallery,
    // required this.gallery_list
  });

  factory ServicesListModel.fromMap(Map<String, dynamic> map) {
    return ServicesListModel(
      img: map['img'],
      name: map['name'],
      service_type: map['service_type'],
      description: map['description'],
      price: map['price'],
      service: map['service'],
      docID: map['docID'],
      comments: map['comments'],
      reviews: map['reviews'],
      shares: map['shares'],
      gallery: List<String>.from(
        map['gallery'],
      ),
      // gallery_list: List<String>.from(
      //   map['gallery_list'],
      // ),
    );
  }
}
