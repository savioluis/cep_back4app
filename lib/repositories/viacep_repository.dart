import 'package:dio/dio.dart';
import 'package:viacep_back4app/models/viacep_model.dart';

class ViaCepRepository {
  final _dio = Dio();

  Future<ViacepModel> consultarCEP(String cep) async {
    var response = await _dio.get("https://viacep.com.br/ws/$cep/json/");
    if (response.statusCode == 200) {
      return ViacepModel.fromMap(response.data);
    } else {
      throw Exception("Erro ao consultar CEP");
    }
  }
}
