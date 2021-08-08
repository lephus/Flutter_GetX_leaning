import 'package:get/get.dart';

class FacultyProvider extends GetConnect {
  Future<List<dynamic>> getFaculty() async {
    try{
      final response = await get("http://192.168.1.9:5000/flutter-get-faculty");
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
}
