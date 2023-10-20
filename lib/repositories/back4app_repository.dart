import 'package:dio/dio.dart';
import 'package:viacep_back4app/interceptor/back4app_interceptor.dart';
import 'package:viacep_back4app/models/cep_back4app_model.dart';
import 'package:viacep_back4app/models/viacep_model.dart';

class Back4appRepository {
  final String _url = "/Ceps";
  final _dio = Dio();

  Back4appRepository() {
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.headers["X-Parse-REST-API-Key"] =
        "REST-API-KEY HERE";
    _dio.options.headers["X-Parse-Application-Id"] =
        "Application-Id HERE";
    _dio.options.baseUrl = "https://parseapi.back4app.com/classes";
    _dio.interceptors.add(Back4AppDioInterceptor());
  }

  Future<List<CepBack4appModel>> getCeps() async {
    var response = await _dio.get(_url);
    print('CEPS: ${response.data["results"]}');
    return (response.data["results"] as List)
        .map((i) => CepBack4appModel.fromMap(i as Map<String, dynamic>))
        .toList();
  }

  Future<void> setCep(ViacepModel cep) async {
    final data = cep.toJson();

    var response = await _dio.post(_url, data: data);
    print('CEP SETADO: $response');
  }
}
