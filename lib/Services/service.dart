import 'package:testgetxtest/Services/Check/CheckService.dart';
import 'package:testgetxtest/Services/Check/CheckServiceAPI.dart';
import 'package:testgetxtest/Services/Check/ICheckService.dart';

class Service{


static ICheckService get checkService{
  return CheckService(CheckServiceAPI());
}

}