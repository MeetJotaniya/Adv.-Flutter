import 'package:adv_flutter_lab/Lab11/api/api_services.dart';
import 'package:adv_flutter_lab/Lab11/user_api_model.dart';
import 'package:get/get.dart';

enum UserState {
  loading,
  success,
  error,
}

class UserApiController extends GetxController{
  RxList<UserApiModel> userList = <UserApiModel>[].obs;
  Rx<UserState> state = UserState.loading.obs;
  RxString errorMessage = ''.obs;
  RxList<UserApiModel> filteredUsers = <UserApiModel>[].obs;
  RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getUsers();
  }

  void getUsers() async {
    state.value = UserState.loading;
    try {
      final users = await ApiService().fetchUsers();
      if (users.isNotEmpty) {
        userList.value = users;
        filteredUsers.value = users;
        state.value = UserState.success;
      } else {
        userList.clear();
        filteredUsers.clear();
        errorMessage.value = "No data received.";
        state.value = UserState.error;
      }
    } catch (e) {
      userList.clear();
      filteredUsers.clear();
      errorMessage.value = e.toString();
      state.value = UserState.error;
    }
  }

  void filterUsers(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredUsers.value = userList;
    } else {
      filteredUsers.value = userList
          .where((user) => (user.name ?? '')
          .toLowerCase()
          .contains(query.toLowerCase()))
          .toList();
    }
  }
}