import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/constants/routes_constants.dart';
import '../../../core/errors/failure.dart';
import '../../../data/models/company_model.dart';
import '../../../data/models/epat_model.dart';
import '../../../data/models/models.dart';
import '../../../data/repositories/repository.dart';

class DashboardController extends GetxController {
  TokenAccessModel? tokenModel;
  RxList<CompanyModel> companies = <CompanyModel>[].obs;
  RxList<EpatModel> epats = <EpatModel>[].obs;
  Rx<List<CompanyModel>> companyModelSearchRx = Rx<List<CompanyModel>>([]);
  Rx<List<EpatModel>> epatModelSearchRx = Rx<List<EpatModel>>([]);
  RxBool resetar = false.obs;
  RxString startDate = ''.obs;
  RxString endDate = ''.obs;
  @override
  void onInit() async {
    if (GetStorage().hasData('token')) {
      final token = GetStorage().read<Map<String, dynamic>>('token');
      tokenModel = TokenAccessModel.fromMap(token!);
      getCompanies();
      getEpats();
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

  searchEpat(String value) {
    if (value.isEmpty) {
      epatModelSearchRx.value = epats;
    } else {
      epatModelSearchRx.value = epats
          .where((element) =>
              element.aiim.toLowerCase().contains(value.toLowerCase()) ||
              element.drt.toLowerCase().contains(value.toLowerCase()) ||
              element.data.toLowerCase().contains(value) ||
              element.autuado.toLowerCase().contains(value.toLowerCase()))
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
      r.sort((b, a) => a.ordinary.toNumber().compareTo(b.ordinary.toNumber()));
      companies.value = r;
    });
  }

  void resetarDate() {
    startDate.value = '';
    endDate.value = '';
    resetar.value = false;
    getEpats();
  }

  void getEpats() async {
    final result = await Repository().getEpats(tokenModel!.tokenAccess);
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
      epats.value = r;
    });
  }

  Future<void> getEpatsOnFilter(String start, String end) async {
    final result = await Repository()
        .getEpatsOnFilter(start, end, tokenModel!.tokenAccess);

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
      epats.value = r;
      resetar.value = true;
      startDate.value = start;
      endDate.value = end;
      update();
    });
  }

  orderBy(String name) {
    companyModelSearchRx.value = companies;
    if (name.toUpperCase() == 'PEP') {
      companyModelSearchRx.value
          .sort((b, a) => a.pep.toNumber().compareTo(b.pep.toNumber()));
    }
    if (name.toUpperCase() == 'ORDINÁRIO') {
      companyModelSearchRx.value.sort(
          (b, a) => a.ordinary.toNumber().compareTo(b.ordinary.toNumber()));
    }
    if (name.toUpperCase() == 'TOTAL AUTUAÇÃO') {
      companyModelSearchRx.value.sort(
          (b, a) => a.totalAut.toNumber().compareTo(b.totalAut.toNumber()));
    }
    if (name.toUpperCase() == 'TOTAL DECLARADO') {
      companyModelSearchRx.value.sort(
          (b, a) => a.totalDec.toNumber().compareTo(b.totalDec.toNumber()));
    }
    if (name.toUpperCase() == 'MUNICÍPIO') {
      companyModelSearchRx.value.sort((b, a) => a.county.compareTo(b.county));
    }
  }

  orderByEpat(String name) {
    epatModelSearchRx.value = epats;
    if (name.toUpperCase() == 'AIIM') {
      epatModelSearchRx.value.sort((b, a) => a.aiim.compareTo(b.aiim));
    }
    if (name.toUpperCase() == 'DRT') {
      epatModelSearchRx.value.sort((b, a) => a.drt.compareTo(b.drt));
    }
    if (name.toUpperCase() == 'AUTUADO') {
      epatModelSearchRx.value.sort((b, a) => a.autuado.compareTo(b.autuado));
    }
    if (name.toUpperCase() == 'DATA') {
      epatModelSearchRx.value.sort((b, a) => a.data.compareTo(b.data));
    }
    if (name.toUpperCase() == 'ASSUNTO') {
      epatModelSearchRx.value.sort((b, a) => a.assunto.compareTo(b.assunto));
    }
  }

  Future<void> logout() async {
    await Repository().logout();
    Get.back(result: true);
  }
}

extension FormatterString on String {
  double toNumber() {
    if (this.toUpperCase() == '-' || this.toUpperCase() == 'NONE') {
      return 0;
    }
    return double.parse(this
        .toUpperCase()
        .replaceAll('R\$ ', '')
        .replaceAll(',', '')
        .replaceAll('.', ''));
  }
}
