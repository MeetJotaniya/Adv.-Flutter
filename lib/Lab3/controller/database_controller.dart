import 'package:adv_flutter_lab/Lab3/model/database_model.dart';

class DatabaseController {
  Future<void> addUser(DatabaseModel user) async {
    await DatabaseModel.insert(user);
  }

  Future<List<DatabaseModel>> getUsers() async {
    return await DatabaseModel.getAllUsers();
  }

  Future<void> updateUser(DatabaseModel user) async {
    await DatabaseModel.update(user);
  }

  Future<void> deleteUser(int uid) async {
    await DatabaseModel.delete(uid);
  }
}