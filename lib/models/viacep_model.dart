// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ViacepModel {
  String? cep;
  String? cidade;
  String? estado;
  String? rua;
  String? bairro;

  ViacepModel({
    this.cep,
    this.cidade,
    this.estado,
    this.rua,
    this.bairro,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cep': cep,
      'cidade': cidade,
      'estado': estado,
      'rua': rua,
      'bairro': bairro,
    };
  }

  factory ViacepModel.fromMap(Map<String, dynamic> map) {
    return ViacepModel(
      cep: map['cep'] != null ? map['cep'] as String : null,
      cidade: map['localidade'] != null ? map['localidade'] as String : null,
      estado: map['uf'] != null ? map['uf'] as String : null,
      rua: map['logradouro'] != null ? map['logradouro'] as String : null,
      bairro: map['bairro'] != null ? map['bairro'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ViacepModel.fromJson(String source) =>
      ViacepModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ViacepModel(cep: $cep, cidade: $cidade, estado: $estado, rua: $rua, bairro: $bairro)';
  }
}
