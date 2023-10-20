import 'package:viacep_back4app/models/cep_back4app_model.dart';
import 'package:viacep_back4app/models/viacep_model.dart';
import 'package:viacep_back4app/services/http_provider.dart';

class Back4appRepository {
  final String _url = "/classes/Ceps";
  final provider = HttpProvider.back4app();

  Back4appRepository();

  Future<List<CepBack4appModel>> getCeps() async {
    var response = await provider.get(_url);
    print('CEPS: ${response.data["results"]}');
    return (response.data["results"] as List)
        .map((i) => CepBack4appModel.fromMap(i as Map<String, dynamic>))
        .toList();
  }

  Future<void> setCep(ViacepModel cep) async {
    final data = cep.toJson();

    var response = await provider.post(_url, data: data);
    print('CEP SETADO: $response');
  }

  Future<void> deleteCep(String id) async {
    var response = await provider.delete('$_url/$id');
    print('CEP DELETADO: $response');
  }
}
