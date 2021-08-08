import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/app/modules/specialized/providers/specialized_provider.dart';
class SpecializedController extends GetxController {
  var lstSpecialized = List<dynamic>.empty(growable: true).obs;
  var isDataProcessingSpec = false.obs;
  var id = Get.parameters['id'];
  TextEditingController nameTextEditingController = new TextEditingController();
  TextEditingController desTextEditingController  = new TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getSpecialized(id);
  }
  void getSpecialized(var id) {
    try {
      isDataProcessingSpec(true);
      SpecializedProvider().getSpecialized(id).then((resp) {
        isDataProcessingSpec(false);
        lstSpecialized.addAll(resp);
      }, onError: (err) {
        isDataProcessingSpec(false);
        Get.snackbar("Error", err.toString(), backgroundColor: Colors.red,
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white);
        print(err.toString());
      }
      );
    } catch (exception) {
      isDataProcessingSpec(false);
      Get.snackbar("Error", exception.toString(), backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white);
      print(exception.toString());
    }
  }
  // common snack bar
  showSnackBar(String title, String message, Color backgroudColor) {
    Get.snackbar(title, message, backgroundColor: backgroudColor,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white);
  }
  // Refresh List
  void refreshList() async {
    getSpecialized(id);
  }
  // Save Data
  void saveSpecialized(String name, String des) async {
    try {
      isDataProcessingSpec(true);
      SpecializedProvider().addSpecialized(id, name , des).then((resp) {
        print(resp);
        if (resp == "success") {
          clearTextEditingControllers();
          isDataProcessingSpec(false);
          showSnackBar("Add Specialized", "Add Specialized successfully", Colors.green);
          lstSpecialized.clear();
          refreshList();
        } else {
          clearTextEditingControllers();
          isDataProcessingSpec(false);
          showSnackBar("Add Specialized", "Add Specialized successfully", Colors.green);
          lstSpecialized.clear();
          refreshList();
        }
      }, onError: (err) {
        isDataProcessingSpec(false);
        showSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isDataProcessingSpec(false);
      showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }
  // Update Data
  void UpdateData(int id, String name, String des){
    try{
      isDataProcessingSpec(true);
      SpecializedProvider().updateSpecialized(id, name, des).then((resp){
          clearTextEditingControllers();
          isDataProcessingSpec(false);
          showSnackBar("Update Specialized", "Update $name successfully", Colors.green);
          lstSpecialized.clear();
          refreshList();
      }, onError: (err) {
        isDataProcessingSpec(false);
        showSnackBar("Error", err.toString(), Colors.red);
      });
    }catch(exception){
      isDataProcessingSpec(false);
      showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }
// clear the controllers
  void clearTextEditingControllers() {
    nameTextEditingController.clear();
    desTextEditingController.clear();
  }
  // Delete
  void DeleteData(Map data){
    try{
      isDataProcessingSpec(true);
      SpecializedProvider().deleteSpecialized(data).then((resp){
          clearTextEditingControllers();
          isDataProcessingSpec(false);
          showSnackBar("Delete Specialized", "Delete successfully", Colors.green);
          lstSpecialized.clear();
          refreshList();
      }, onError: (err) {
        isDataProcessingSpec(false);
        print(err.toString());
        showSnackBar("Error", err.toString(), Colors.red);
      });
    }catch(exception){
      isDataProcessingSpec(false);
      showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }
}