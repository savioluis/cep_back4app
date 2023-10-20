import 'package:viacep_back4app/models/viacep_model.dart';
import 'package:viacep_back4app/services/http_provider.dart';

class ViaCepRepository {
  final provider = HttpProvider.viacepp();

  Future<ViacepModel> consultarCEP(String cep) async {
    var response = await provider.get("/ws/$cep/json/");
    if (response.statusCode == 200) {
      return ViacepModel.fromMap(response.data);
    } else {
      throw Exception("Erro ao consultar CEP");
    }
  }
}
