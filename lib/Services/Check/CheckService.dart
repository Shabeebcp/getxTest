import 'package:testgetxtest/Model/activity_model.dart';
import 'package:testgetxtest/Services/Check/ICheckService.dart';

class CheckService implements ICheckService {
  late ICheckService service;
  CheckService(ICheckService _service) {
    service = _service;
  }
  ActivityModel activityModel = ActivityModel();

  @override
  Future getAnimal() async {
    var res = await service.getAnimal();
    if (res != null) {
      return ActivityModel.fromJson(res);
    } else {
      ActivityModel();
    }
  }
}
