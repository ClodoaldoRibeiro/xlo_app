import 'package:xlo_app/models/address.dart';
import 'package:xlo_app/models/category.dart';
import 'package:xlo_app/models/user_model.dart';

enum AdStatus { PENDING, ACTIVE, SOLD, DELETED }

class Ad {
  Ad();

  String id;

  List images = [];

  String title;
  String description;

  Category category;

  Address address;

  num price;
  bool hidePhone = false;

  AdStatus status = AdStatus.PENDING;
  DateTime created;

  UserModel user;

  int views;
}
