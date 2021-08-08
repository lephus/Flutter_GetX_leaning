import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/specialized_controller.dart';
class SpecializedView extends StatelessWidget {
  SpecializedController _SpecializedController = Get.put(SpecializedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Specialized'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (_SpecializedController.isDataProcessingSpec.value == true) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (_SpecializedController.lstSpecialized.length > 0) {
            return ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: _SpecializedController.lstSpecialized.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(_SpecializedController
                                .lstSpecialized[index]['image']),
                          ),
                          title: Text(
                              "${_SpecializedController
                                  .lstSpecialized[index]['name']}"
                          ),
                          subtitle: Text(
                              "${_SpecializedController
                                  .lstSpecialized[index]['des']}"
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: RaisedButton.icon(
                                    onPressed: (){
                                      displayUpdateSpecializedWindow(_SpecializedController.lstSpecialized[index]['id'],
                                          _SpecializedController.lstSpecialized[index]['name'],
                                          _SpecializedController.lstSpecialized[index]['des']);
                                    },
                                    color: Colors.amber[100],
                                    hoverColor: Colors.amber[100],
                                    icon: Icon(Icons.update, color:Colors.amber),
                                    label: Text("")),
                              ),
                              SizedBox(height: 2,),
                              Expanded(child:
                              GestureDetector(
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onTap: (){
                                  displayDeleteDialog(_SpecializedController.lstSpecialized[index]['id'], _SpecializedController.lstSpecialized[index]['name']);
                                },
                              )
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
            );
          } else {
            return Column(children: [Text("No Data Specialized"),]);
          }
        }
      }),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Add your onPressed code here!
            displayAddSpecializedWindow();
          },
          label: const Text('Add Specialized'),
          icon: const Icon(Icons.add)
      ),
    );
  }
  void displayDeleteDialog(var id, String Name){
    Get.defaultDialog(
      title: "Delete $Name ?",
      titleStyle: TextStyle(fontSize: 20),
      middleText: "Are you sure delete $Name ?",
      textCancel: "Cancel",
      textConfirm: 'Confirm',
      confirmTextColor: Colors.white,
      onCancel: (){Get.back();},
      onConfirm: (){
        _SpecializedController.DeleteData({'idSpecialized': id, 'idFaculty': Get.parameters['id']});
        Get.back();
      }
    );
  }

  void displayUpdateSpecializedWindow(int id, String name, String des) {
    _SpecializedController.nameTextEditingController.text = name;
    _SpecializedController.desTextEditingController.text = des;
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
          color: Colors.white,
        ),
        child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Update Task',
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'name Specialized',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      controller: _SpecializedController.nameTextEditingController,
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        hintText: 'Description',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      controller: _SpecializedController.desTextEditingController,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Obx(() {
                          return RaisedButton(
                            child: Text(
                                _SpecializedController.isDataProcessingSpec.value == true
                                    ? 'Processing...'
                                    : 'Update'),
                            onPressed: () {
                              if (_SpecializedController.isDataProcessingSpec.value == false) {
                                print(_SpecializedController.nameTextEditingController.text);
                                print(_SpecializedController.desTextEditingController.text);
                                _SpecializedController.UpdateData(id, _SpecializedController.nameTextEditingController.text, _SpecializedController.desTextEditingController.text);
                                Get.back();
                              }
                            },
                          );
                        })
                      ],
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }


  void displayAddSpecializedWindow() {
    _SpecializedController.clearTextEditingControllers();
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
          color: Colors.white,
        ),
        child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Task',
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'name Specialized',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      controller: _SpecializedController.nameTextEditingController,
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        hintText: 'Description',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      controller: _SpecializedController.desTextEditingController,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Obx(() {
                          return RaisedButton(
                            child: Text(
                                _SpecializedController.isDataProcessingSpec.value == true
                                    ? 'Processing...'
                                    : 'Save'),
                            onPressed: () {
                              if (_SpecializedController.isDataProcessingSpec.value == false) {
                                print(_SpecializedController.nameTextEditingController.text);
                                print(_SpecializedController.desTextEditingController.text);
                                _SpecializedController.saveSpecialized(_SpecializedController.nameTextEditingController.text, _SpecializedController.desTextEditingController.text);
                                Get.back();
                              }
                            },
                          );
                        })
                      ],
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

