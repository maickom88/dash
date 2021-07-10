import 'dart:async';

import 'package:dash/core/constants/routes_constants.dart';
import 'package:dash/core/errors/failure.dart';
import 'package:dash/data/models/company_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repository.dart';

class DashboardController extends GetxController {
  TokenAccessModel? tokenModel;
  RxList<CompanyModel> companies = <CompanyModel>[].obs;
  Rx<List<CompanyModel>> companyModelSearchRx = Rx<List<CompanyModel>>([]);
  @override
  void onInit() async {
    if (GetStorage().hasData('token')) {
      final token = GetStorage().read<Map<String, dynamic>>('token');
      tokenModel = TokenAccessModel.fromMap(token!);
      getCompanies();
    } else {
      await logout();
    }
  }

  searchCompany(String value) {
    if (value.isEmpty) {
      companyModelSearchRx.value = companies;
    } else {
      companyModelSearchRx.value = companies
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()) ||
              element.cnpj.toLowerCase().contains(value.toLowerCase()) ||
              element.ordinary.toLowerCase().contains(value) ||
              element.pep.toLowerCase().contains(value.toLowerCase()) ||
              element.totalAut.toLowerCase().contains(value.toLowerCase()) ||
              element.totalDec.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
  }

  void getCompanies() async {
    final result = await Repository().getCompanies(tokenModel!.tokenAccess);
    result.fold((l) async {
      if (l is UnauthorizedError) {
        await logout();
        Get.offAllNamed(RoutesConsts.login);
      }
      Get.snackbar(
        "Ops, houve um error",
        l.getMessage,
        colorText: Colors.white,
        backgroundColor: Colors.red[800],
      );
    }, (r) {
      companies.value = r;
    });
  }

  Future<void> logout() async {
    await Repository().logout();
    Get.back(result: true);
  }
}
