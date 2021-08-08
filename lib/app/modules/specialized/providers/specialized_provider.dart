import 'package:get/get.dart';

class SpecializedProvider extends GetConnect {
  Future<List<dynamic>> getSpecialized(var id) async{
    try{
      final response = await get("http://192.168.1.9:5000/flutter-get-specialized/$id");
      if (response.status.hasError){
        return Future.error(response.statusText);
      }else{
        print(response.body);
        return response.body;
      }
    }catch(exception){
      return Future.error(exception.toString());
    }
  }
  Future<Response<dynamic>> addSpecialized(var idFaculty, var name, var des) {
    try {
      final form = FormData({
        'idFaculty': idFaculty,
        'name' : name,
        'des' : des
      });
      return post('http://192.168.1.9:5000/flutter-insert-specialized', form);
    }catch(exception){
      return Future.error(exception.toString());
    }
  }
  Future<Response<dynamic>> updateSpecialized(var idSpec, var name, var des){
    try {
      final data = {
        'idSpec': idSpec,
        'name' : name,
        'des' : des
      };
      return put('http://192.168.1.9:5000/flutter-update-specialized', data);
    }catch(exception){
      print(exception.toString());
      return Future.error(exception.toString());
    }
  }
  Future<Response<dynamic>> deleteSpecialized(Map data){
    try {
      return put('http://192.168.1.9:5000/flutter-delete-specialized', data);
    }catch(exception){
      // print(exception.toString());
      return Future.error(exception.toString());
    }
  }
}
