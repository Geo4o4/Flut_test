class DataModel {
  String? name;
  String? description;
  double? price;
  String? imageUrl;

  DataModel({
    this.name,
    this.description,
    this.price,
    this.imageUrl,
});
factory DataModel.fromMapJson(Map<String, dynamic> map) {
  return DataModel(
    name: map['title'],
    imageUrl: map['thumbnail'],
    price: map['price'],
    description: map['description']
  );
}
}