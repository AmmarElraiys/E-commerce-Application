import 'package:e_commerce_application/core/class/statusrequist.dart';

handlingData(response) {
  if (response is StatusRequist) {
    return response;
  } else {
    return StatusRequist.success;
  }
}
