import 'dart:convert';
import 'dart:developer';

import 'package:football/modules/dashbord/ranking/model/form_model.dart';
import 'package:football/modules/dashbord/ranking/model/ranking_model.dart';
import 'package:football/modules/dashbord/ranking/services/ranking_service.dart';
import 'package:football/utils/utils.dart';
import 'package:get/get.dart';
import 'package:xml2json/xml2json.dart';

class RankingController extends GetxController {
  List<String> tableType = ['FULL', 'SHORT', 'FORM'];
  RxList<String> locationList = ['Overall', 'Home', 'Away'].obs;
  RxString selectedLocationList = 'Overall'.obs;
  RxInt isSelectedType = 1.obs;
  final Xml2Json _xml2json = Xml2Json();
  Rx<RankingTableModel> rankingTableModel = RankingTableModel().obs;
  Rx<FormModel> formModel = FormModel().obs;
  RxBool isLoading = false.obs;
  RxBool isFormLoading = false.obs;

  Future<RankingTableModel?> tableApiCall() async {
    try {
      isLoading.value = true;
      var response = await RankingService.tableApi();
      String xmlFormat = Utils.instance.xmlFormatString(response);
      _xml2json.parse(xmlFormat);
      var json = _xml2json.toBadgerfish();
      rankingTableModel.value = RankingTableModel.fromJson(jsonDecode(json));
      log("result====>${rankingTableModel.value.root?.table?.subt?.length}");
      isLoading.value = false;
      return rankingTableModel.value;
    } catch (e) {
      isLoading.value = false;
      return null;
    } finally {
      isLoading.value = false;
    }
  }

  Future<FormModel?> formApiCall() async {
    try {
      isFormLoading.value = true;
      var response = await RankingService.formApi();
      formModel.value = FormModel.fromJson(jsonDecode(response));
      print('formResult====> controller  ${formModel.value.teamForm?.length}');
      return formModel.value;
    } catch (e, st) {
      isFormLoading.value = false;
      print('error in fixtureApi  $e--------$st');
    } finally {
      isFormLoading.value = false;
    }
    return null;
  }

  @override
  void onInit() {
    formApiCall();
    tableApiCall();
    super.onInit();
  }
}
