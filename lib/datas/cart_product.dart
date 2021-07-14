import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lojavirtualestudo/datas/product_data.dart';

class CartProduct {
  String _cid;
  String _category;
  String _pid;
  int _quantity;
  String _size;

  ProductData _productData;

  CartProduct.fromDocument(DocumentSnapshot document) {
    this._cid = document.documentID;
    this._category = document.data["category"];
    this._pid = document.data["pid"];
    this._quantity = document.data["quantity"];
    this._size = document.data["size"];
  }

  CartProduct();

  Map<String, dynamic> toMap() {
    return {
      "category": this._category,
      "pid": this._pid,
      "quantity": this._quantity,
      "size": this._size,
      //"product": this._productData.toResumedMap(),
    };
  }

  String get cid {
    return this._cid;
  }

  set cid(String cid) {
    this._cid = cid;
  }

  set category(String category) {
    this._category = category;
  }

  String get category {
    return this._category;
  }

  set pid(String pid) {
    this._pid = pid;
  }

  String get pid {
    return this._pid;
  }

  set quantity(int quantity) {
    this._quantity = quantity;
  }

  int get quantity {
    return this._quantity;
  }

  set size(String size) {
    this._size = size;
  }

  String get size {
    return this._size;
  }

  set productData(ProductData productData) {
    this._productData = productData;
  }

  ProductData get productData {
    return this._productData;
  }
}
