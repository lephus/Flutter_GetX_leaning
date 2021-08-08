import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
        centerTitle: true,
      ),
      body: Obx((){
        if(controller.isDataProcessing.value == true){
          return Center(
            child: CircularProgressIndicator(),
          );
        }else{
          if(controller.lstFaculty.length > 0){
            return  ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: controller.lstFaculty.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Text(
                              "${controller.lstFaculty[index]['id']}"
                            ),
                          title: Text(
                              "${controller.lstFaculty[index]['name']}"
                          ),
                          onTap: (){
                            Get.toNamed("/specialized?id=${controller.lstFaculty[index]['id']}");
                          },
                        ),
                      ],
                    ),
                  );
                }
            );
          }else{
            return Center(child: Text("No Data"),);
          }
        }
      })
    );
  }
}
