import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_app/models/address.dart';
import 'package:xlo_app/models/category.dart';
import 'package:xlo_app/models/uf.dart';
import 'package:xlo_app/models/user_model.dart';
import 'package:xlo_app/repositories/table_keys.dart';
import 'package:xlo_app/repositories/user_repository.dart';

import 'city.dart';

enum AdStatus { PENDING, ACTIVE, SOLD, DELETED }

class Ad {
  Ad();

  Ad.fromParse(ParseObject object) {
    id = object.objectId;
    title = object.get<String>(keyAdTitle);
    description = object.get<String>(keyAdDescription);
    images = object.get<List>(keyAdImages).map((e) => e.url).toList();
    hidePhone = object.get<bool>(keyAdHidePhone);
    price = object.get<num>(keyAdPrice);
    created = object.createdAt;
    address = Address(
      district: object.get<String>(keyAdDistrict),
      city: City(name: object.get<String>(keyAdCity)),
      cep: object.get<String>(keyAdPostalCode),
      uf: UF(initials: object.get<String>(keyAdFederativeUnit)),
    );
    views = object.get<int>(keyAdViews, defaultValue: 0);
    category = Category.fromParse(object.get<ParseObject>(keyAdCategory));
    status = AdStatus.values[object.get<int>(keyAdStatus)];
    user = UserRepository().mapParseToUser(object.get<ParseUser>(keyAdOwner));
  }

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
