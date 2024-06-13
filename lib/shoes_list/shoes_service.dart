import 'package:firebase_database/firebase_database.dart';
import 'package:shoesly/shoes_list/model/shoes_model.dart';

class ShoesService {
  Future<ShoeModel?> fetchShoesList() async {
    final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    final data = await databaseReference.root.once();
    final map = Map<String, dynamic>.from(data.snapshot.value as Map);
    return ShoeModel.fromMap(map);
  }
}
