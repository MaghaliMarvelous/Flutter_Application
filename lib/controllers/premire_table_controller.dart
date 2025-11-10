import 'dart:convert';
import 'package:flutter_application_pplg1_20/models/table_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PremireTableController extends GetxController {
  var isLoading = false.obs;
  var standings = <Table>[].obs;
  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchPremierTable();
  }
  
    fetchPremierTable() async{
    const url = "https://www.thesportsdb.com/api/v1/json/3/lookuptable.php?l=4328&s=2025-2026";
    try { 
      //code yang memungkinan nge crash
      isLoading.value = true;
      final response = await http.get(Uri.parse(url));
      print("status code " +response.statusCode.toString());
      print("json result "+ response.body.toString());

      if (response.statusCode == 200 ){
        final data  = jsonDecode(response.body);
        final List standingData = data['table'];
        standings.assignAll(standingData.map((e) => Table.fromJson(e)).toList());
        //mengisi variabel standings dari data data model standingdata (json)
      }
      else{
        Get.snackbar("error", "Failed to load data from API");
      }
    } catch (e) {
      //ketika nge crash di tangkap di catch lalu diubah jadi warning
      Get.snackbar("error", e.toString());
    }
    isLoading.value = false;
  }
}