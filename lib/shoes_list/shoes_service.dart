import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:shoesly/shoes_list/model/shoes_model.dart';

class ShoesService {
  Future<ShoesModel?> fetchShoesList() async {
    final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    final data = await databaseReference.root.once();
    final map = Map<String, dynamic>.from(data.snapshot.value as Map);
    final json = jsonEncode(map);
    print(json);
    return shoesModelFromJson(json);
  }
}
