import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  //static const CART = "cart";

  String? id;
  String? name;
  String? email;
  // late List<CartItemModel> cart;

  UserModel({
    this.id,
    this.name,
    this.email,
  });

  UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    name = (snapshot.data() as dynamic)[NAME];
    email = (snapshot.data() as dynamic)[EMAIL];
    id = (snapshot.data() as dynamic)[ID];
    //cart = _convertCartItems(snapshot.data()?[CART] ?? []);
  }

  // List<CartItemModel> _convertCartItems(List cartFomDb){
  //   List<CartItemModel> _result = [];
  //   if(cartFomDb.length > 0){
  //     cartFomDb.forEach((element) {
  //     _result.add(CartItemModel.fromMap(element));
  //   });
  //   }
  //   return _result;
  // }

  // List cartItemsToJson() => cart.map((item) => item.toJson()).toList();
}
