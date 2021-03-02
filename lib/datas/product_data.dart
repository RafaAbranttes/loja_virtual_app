import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData {
  String _category;
  String _id;
  String _title;
  String _description;
  double _price;
  List _images;
  List _sizes;

  ProductData.fromDocument(DocumentSnapshot snapshot) {
    this._id = snapshot.documentID;
    this._title = snapshot.data["title"];
    this._description = snapshot.data["description"];
    this._price = snapshot.data["price"] + 0.0;
    this._images = snapshot.data["images"];
    this._sizes = snapshot.data["sizes"];
  }

  set id(String id) {
    this._id = id;
  }

  String get id {
    return this._id;
  }

  set title(String title) {
    this._title = title;
  }

  String get title {
    return this._title;
  }

  set description(String description) {
    this._description = description;
  }

  String get descrition {
    return this._description;
  }

  set price(double price) {
    this._price = price;
  }

  double get price {
    return this._price;
  }

  set images(List images) {
    this._images = images;
  }

  List get images {
    return this._images;
  }

  set sizes(List sizes) {
    this._sizes = sizes;
  }

  List get sizes {
    return this._sizes;
  }
}
