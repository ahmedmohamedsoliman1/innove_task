import 'package:dio/dio.dart';

class ApiClient {

  Dio dio ;

  ApiClient ({required this.dio});

  Future <Response> post ({
    required String url , isFormData = true ,required Map <String , dynamic> body , Map <String , dynamic>? headers}) {
    FormData formData = FormData.fromMap(body);

    return dio.post(url ,
        options: Options(
            contentType: 'application/json',
            headers: headers,
            validateStatus: (_) => true
        ) ,
        data: isFormData ? formData : body);
  }

  Future<Response> get ({
    required String url ,
    Map <String , dynamic>? headers
  }) {
    return dio.get(url ,
        options: Options(
          contentType: 'application/json',
          headers: headers,
          validateStatus: (_) => true ,
        ));
  }
}