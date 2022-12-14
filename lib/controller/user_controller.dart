import 'package:get/get.dart';
import 'package:qr_scanner/view/widget/scanQR/sucsses.dart';

import '../model/user/user_model.dart';

class UserController extends GetxController {
  final uniqueString = "".obs;
  final userName = "".obs;
  final userCompany = "".obs;
  final userJob = "".obs;
  final isScanned = false.obs;
  final users = [
    User('Norah Mohammed', 'altamiminourahcs@gmail.com', 'Developer',
        'The Garage'),
    User('Lmise Mohammed', 'lamisabdullah@outlook.com', 'Developer',
        'The Garage'),
    User('Arwa Mohammed', 'noramsrt@gmail.com', 'UI/UX Designer', 'The Garage')
  ].obs;
  final entrants = [].obs;

  void currentUser(int index) {
    userName.value = users[index].name!;
    uniqueString.value = users[index].email!;
    userJob.value = users[index].job!;
    userCompany.value = users[index].company!;
  }

  void addEntrant(String email) {
    entrants.add(Entrant(userName.value, email, userJob.value,
        userCompany.value, DateTime.now()));
  }

  bool errorChecker(String email) {
    var contain = entrants.where((element) => element.email == email);
    if (contain.isEmpty) {
      findUser(email);
      addEntrant(email);
      print("Sucsses");
      return true;
    } else {
      return false;
    }
  }

  void findUser(String email) {
    for (int i = 0; i < users.length; i++) {
      if (users[i].email == email) {
        userName.value = users[i].name!;
        uniqueString.value = email;
        userJob.value = users[i].job!;
        userCompany.value = users[i].company!;
      }
    }
  }
}

final isSucsses = false.obs;
bool isSucssesFun() {
  return true;
}
