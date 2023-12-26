class AdminModel {
  final String name;
  final String uid;

  AdminModel({required this.name, required this.uid});

  factory AdminModel.fromMap(Map<String, dynamic> map) {
    return AdminModel(name: map['name'], uid: map['uid']);
  }
}
