import 'package:get/get.dart';
import 'package:testgetxtest/Model/activity_model.dart';
import 'package:testgetxtest/Services/Check/ICheckService.dart';
import 'package:testgetxtest/Services/service.dart';

///[GetxController] to use GetX Functionalities
class IndexViewState extends GetxController {
  late ICheckService checkService;
  IndexViewState() {
    checkService = Service.checkService;
  }

  String? myUserName;
  RxInt counter = 0.obs;
  ActivityModel activityModel = ActivityModel();

  Future getUserName() async {
    if (myUserName == 'Click Again') {
      myUserName = 'ShabeebCp';
    } else {
      myUserName = 'Click Again';
    }

    ///[--update()-- Alternative notifyListner]
    update();
    return myUserName;
  }

  Future getCheckApi() async {
    var res = await checkService.getAnimal();
    if (res != null) {
      activityModel = res;
    } else {
      activityModel = ActivityModel();
    }

    ///[--update()-- Alternative notifyListner]
    update();
  }

  //////////////////[obx Checking]//////
  incremenFunction() {
    counter++;
  }
}
