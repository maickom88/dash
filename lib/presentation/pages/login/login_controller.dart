import 'package:dash/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/repositories/repository.dart';
import '../../components/dash_loading.dart';

class LoginController extends GetxController {
  Future<void> login(String email, password) async {
    Get.dialog(DashLoading(), barrierDismissible: false);
    final result = await Repository().login(email, password);
    result.fold((l) {
      Get.back();
      Get.snackbar(
        "Ops, houve um error",
        l.getMessage,
        colorText: Colors.white,
        backgroundColor: Colors.red[800],
      );
    }, (r) async {
      Get.back();
      Get.offAllNamed(RoutesConsts.dashboard);
    });
  }

  @override
  void onInit() {
    if (GetStorage().hasData('token')) {
      Get.back();
    }

    super.onInit();
  }
}
