import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/app/modules/home/providers/faculty_provider.dart';

class HomeController extends GetxController {
  var lstFaculty = List<dynamic>.empty(growable: true).obs;
  var isDataProcessing = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // fetch data
    getFaculty();
  }
  void getFaculty(){
    try{
      isDataProcessing(true);
      FacultyProvider().getFaculty().then((resp){
          isDataProcessing(false);
          lstFaculty.addAll(resp);
      },onError: (err){
          isDataProcessing(false);
          showSnackBar("Error", err.toString(), Colors.red);
          print(err.toString());
        }
     );
    }catch(exception){
        isDataProcessing(false);
        showSnackBar("Error", exception.toString(), Colors.red);
        print(exception.toString());
    }
  }
  // common snack bar
  showSnackBar(String title, String message, Color backgroudColor){
    Get.snackbar(title, message, backgroundColor: backgroudColor, snackPosition: SnackPosition.BOTTOM, colorText: Colors.white);
  }
}
