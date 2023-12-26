class ExpertsPageModel {
  final String docID;
  final String img;
  final String name;
  final String service;
  final String price;
  final String comments;
  final String reviews;
  final String shares;
  final List<String> gallery_list;

  ExpertsPageModel({
    required this.docID,
    required this.img,
    required this.name,
    required this.service,
    required this.price,
    required this.comments,
    required this.reviews,
    required this.shares,
    required this.gallery_list,
  });

  factory ExpertsPageModel.fromMap(Map<String, dynamic> map) {
    return ExpertsPageModel(
      docID: map['docID'],
      img: map['img'],
      name: map['name'],
      service: map['service'],
      price: map['price'],
      comments: map['comments'],
      reviews: map['reviews'],
      shares: map['shares'],
      gallery_list: List<String>.from(map['gallery_list']),
    );
  }
}
